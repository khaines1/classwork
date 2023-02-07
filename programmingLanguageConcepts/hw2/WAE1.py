from WAE1Parser import parser

def read_input():
  result = ''
  while True:
    data = input('WAE: ').strip() 
    if ';' in data:
      i = data.index(';')
      result += data[0:i+1]
      break
    else:
      result += data + ' '
  return result

def main():
  while True:
    data = read_input() 
    if data == 'exit;':
      break
    try:
      if parser.parse(data):
        print("ACCEPT: No Repeated With-Vars")
      else:
        print("REJECT: Repeated With-Vars")
    except Exception as inst:
      print(inst.args[0])
      continue
 
main()
