from LispParser import parser

def evalNum(tree):

 result = 0
 message = ' '

 if tree[0] is None:
  return 0

 if tree[1] is None and tree[2] is None:
  return (tree[0])

 if tree[0] == 'num':
  print('evalNum result ' + str(tree[1]))
  return tree[1]

 #elif tree[0] == 'var':

 elif tree[0] == '+':
  #print('left ' + str(evalNum(tree[1])) + ' right ' + str(evalNum(tree[2])))
  return evalNum(tree[1]) + evalNum(tree[2])

 elif tree[0] == '-':
  return evalNum(tree[1]) - evalNum(tree[2])

 elif tree[0] == '*':
  return evalNum(tree[1]) * evalNum(tree[2])

 elif tree[0] == '/':
  try:
   return evalNum(tree[1]) / evalNum(tree[2])
  except ZeroDivisionError:
      print('ERROR! Divide by zero!')

 elif tree[0] == 'car':
 # print('tree befor car: ' + str(tree)) 
  print(evalList(tree))
  return evalList(tree)

 elif tree[0] == 'cdr':
 # print('before cdr ' + str(tree))
  return evalList(tree)

 else:
  evalList(tree)
 #print(result)
 #return result
def evalList(tree):

# result = ()
 message = ' '

# print('tree0 ' + str(tree[0]) + ' tree1 ' + str(tree[1]))
 if tree == []:
  return []

 #if tree[1] is None and tree[2] is None:
  #return (tree[0])

# left = evalNum(tree[0])
 #right = evalList(tree[1])

 #result.append(left)
 #result.append(left)
 #result.append(right)

# elif tree[0] == 'cdr':
 # try:
  # temp = tree[1:]
   #print('temp' + str(temp[0][1]))
   #evalList(temp[0][1])
  #except IndexError:
   #print('ERROR! CDR of empty list!')

# elif tree[0] == 'car':
 # return tree[1][0][1]

# else:
#  print('tree0 ' + str(tree[0]) + 'tree1 ' + str(tree[1]))
 result = evalNum(tree[0]),evalList(tree[1])
 print(result)
 # return tree[1][0][1]
 return result

# else:
 # return evalNum(tree[0])

#def substitute(var, val, tree):

def main():
  while True:
    data = input('Lisp: ').strip()
    if data == 'exit;':
      break
    try:
      tree = parser.parse(data)
    except Exception as inst:
      print(inst.args[0])
      continue
    print(tree)
    #evalNum(tree)
    print('The value is ' + str(evalNum(tree)))
main()
