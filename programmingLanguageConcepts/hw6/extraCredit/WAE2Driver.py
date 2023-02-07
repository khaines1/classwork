from WAE2DriverParser import parser
import sys
import re

def makeDriver(tree,c):
  #driver = open('aDirver.scala', 'w')
  result = ''
  count = c
  if tree[0] is None:
    return ''
  if tree[0] == 'num':
     result += 'WAENode(nodeType = "num", numValue =  ' + str(tree[1]) + ')'
  elif tree[0] == 'id':
     result += 'WAENode(nodeType = "id", idValue =  ' + '"' + str(tree[1]) + '\")'

  elif tree[0] == 'with':
     result += 'WAENode(nodeType = "with",\nvars = List(%s,%s)' % (str(withFound(tree[1],0)), str(withExpr(tree[2],1)))

  elif tree[0] == '+':
     result += 'WAENode(nodeType = "+",\n'
     result += 'child1 = ' + str(makeDriver(tree[1],0)) + ",\n"
     result += 'child2 = ' + str(makeDriver(tree[2],0)) + "\n)"
  elif tree[0] == '-':
     result += 'WAENode(nodeType = "-",\n'
     result += 'child1 = ' + str(makeDriver(tree[1],0)) + ",\n"
     result += 'child2 = ' + str(makeDriver(tree[2],0)) + "\n)"
  elif tree[0] == '*':
     result += 'WAENode(nodeType = "*",\n'
     result += 'child1 = ' + str(makeDriver(tree[1],0)) + ",\n"
     result += 'child2 = ' + str(makeDriver(tree[2],0)) + "\n)"
  elif tree[0] == '/':
     result += 'WAENode(nodeType = "/",\n'
     result += 'child1 = ' + str(makeDriver(tree[1],0)) + ",\n"
     result += 'child2 = ' + str(makeDriver(tree[2],0)) + "\n)"

  elif tree[0] == 'if':
    print(tree[1])
    result += 'WAENode(nodeType = "if",\n'
    result += 'child1 = ' + str(makeDriver(tree[1],0)) + ",\n"
    result += 'child2 = ' + str(makeDriver(tree[2],0)) + ",\n"
    result += 'child3 = ' + str(makeDriver(tree[3],0)) + "\n)"
  return result

def withFound(tree,c):
   count = c
   result = ''
   if count > 1:
      result += '\n),\n'
   if tree[0] is None:
    return ''

   if re.match(r'[x-zX-Z]',tree[0][0]):
      result += '(\"' + str(tree[0][0]) + '\",' + str(makeDriver(tree[0][1],0)) + '\n),\n' 

      if re.match(r'[x-zX-Z]',tree[1][0]):
         result += '(\"' + str(tree[1][0]) + '\",' + str(makeDriver(tree[1][1],0)) + '\n)\n)'
   return result

def withExpr(tree,c):
   result = ''
   count = c
   if tree[0] is None:
      result = ''
   else:
     result += '\nchild' + str(count) + ' =' + str(makeDriver(tree,0)) 
   return result

def main():
  eNum = 0
  print('object Driver extends App {\nimport WAE._\n\nval d = Map[String,Double]()\n ')
  while True:
    data = input('WAE: ').strip()
    if data == 'exit;':
      break
    try:
      tree = parser.parse(data)
    except Exception as inst:
      print(inst.args[0])
      continue
    print(tree)
    print('val e%d = '% (eNum) )
    print(makeDriver(tree,0))
    print('println(eval(e%d,d))\n'% (eNum))
    eNum += 1
  print('}')
main()
