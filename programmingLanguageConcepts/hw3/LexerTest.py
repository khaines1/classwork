import sys
from Lexer import *
from TokenTypes import *

def main():
  input = sys.argv[1]
  lexer = Lexer(input)
  print("Tokenizing ",end="")
  print(input)
  while True:
    t = lexer.lex()
    if t.get_token().value == TokenTypes.EOF.value:
      break

main()
