from JSONParser import parser

def read_input():
  result = ''
  while True:
    data = input('JSON: ').strip() 
    if ';' in data:
      i = data.index(';')
      result += data[0:i+1]
      break
    else:
      result += data + ' '
  return result

def main():
  while True:
    data = read_input().strip() 
    if data == 'exit;':
      break
    try:
      #print(data)
      if parser.parse(data):
        print("VALID")
      else:
        print("INVALID")
    except Exception as inst:
      print(inst.args[0])
      continue
 
main()
