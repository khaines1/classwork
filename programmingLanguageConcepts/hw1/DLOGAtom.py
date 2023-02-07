from DLOGAtomParser import parser

#takes parse tree
def rename(t):
 result = ''
 #form rename string
 for i in range(len(t[1])):
  if i == len(t[1])-1:
   result += 'x_' + str(i) 
  else:
   result += 'x_' + str(i) + ','
 return result

#takes parse tree and result of rename()
def select(t,r):
 #convert result of rename() into list
 renamed = list(r.split(','))
 newList = []
 result = '(select['
 repeated = []
 temp = []
#find unique values
 for i in range(len(t[1])):
  pair = [t[1][i][0],t[1][i][1]]
 #pair = [renamed[i],t[1][i][1]]
  value = t[1][i][1]
  index = renamed[i]
  if pair not in newList:
   newList.append(pair)
 temp = newList 
# find unique pairs 
 #for i in range(len(t[1])):
 for i in range(len(newList)):
  for j in range(len(newList)):
   if pair in newList:
    del temp[j]
 newList = temp
 #rewrite in x_n format
 for i in range(len(t[1])):
  for j in range(i+1,len(newList)):
   if newList[j][1] == t[1][i][1]:
     newList[j][0] = renamed[i]
 #create x_n,value pairs and 
 #make a list of all that have same value
 for i in range(len(t[1])):
  index = renamed[i]
  value = t[1][i][1]
  for j in range(i+1,len(t[1])):
   testValue = t[1][j][1]
   testIndex = renamed[j]
   if testValue == value:
    repeated.append([index,testIndex])
 #remove any repeated items from repeated list
 temp = repeated
 for i in range(len(repeated)):
  for j in range(i+1,len(repeated)):
   if repeated[i][1] == value:
    del repeated[j]
 #add repeated list to newList
 for i in range(len(repeated)):
  newList.append(repeated[i])
 #form select string
 for i in range(len(newList)):
  if i == len(newList)-1:
   result += newList[i][0] + '=' + str(newList[i][1]) + ']'
  else: 
   result +=  newList[i][0] + '=' + str(newList[i][1]) + ' and '
  return result

#takes parse tree and result of rename()
def project(t,r):
 result = '(project['
 renamed = list(r.split(','))
 newList = []
 temp = []
 temp2 = []
 #find list itens with type 'var'
 for i in range(len(t[1])):
  pair = [renamed[i],t[1][i][1]]
  type = t[1][i][0]
  value = t[1][i][1]
  index = renamed[i]
  if (pair not in newList) and (type == 'var'):
   newList.append(pair)
 #find x_n,value pairs whith unique values 
 for i in range(len(newList)):
  #for j in range(i+1,len(newList)):
  if (newList[i][1] not in temp):
   temp.append(newList[i][1])
   temp2.append(newList[i])
 newList = temp2
  #form project string
 for i in range(len(newList)):
  if i == len(newList)-1:
   result += newList[i][0] + ']'
  else:
   result += newList[i][0] + ','
  return result
#takes parse tree and result of rename()
def final_rename(t,r):
 result = 'rename['
 newList = []
 temp = []
 for i in range(len(t[1])):
  pair = [t[1][i][0],t[1][i][1]]
  type = t[1][i][0]
  value = t[1][i][1]
  if (pair not in newList) and type == 'var':
   newList.append(value)
 #find unique variables 
 for i in range(len(newList)):
  if newList[i] not in temp:
   temp.append(newList[i])
 newList = temp
 #form final rename string
 for i in range(len(newList)):
  if i == len(newList)-1:
   result += newList[i] + ']' 
  else:
   result += newList[i] + ','
 return result

def main():
  while True:
    data = input('DLGAtom: ').strip()  
    if data == 'exit':
      break
    try:
      tree = parser.parse(data)
    except Exception as inst:
      print(inst.args[0])
      continue
    #print(tree)
    tRename = rename(tree)
    tSelect = select(tree,tRename)
    tProject = project(tree,tRename)
    tFinal = final_rename(tree,tRename)
    #Create DLOGAtom string
    print(tFinal + tProject + tSelect + '('+ tRename +')'+'(' + str(tree[0]) + ')'+')'+')'+')' )
main()

