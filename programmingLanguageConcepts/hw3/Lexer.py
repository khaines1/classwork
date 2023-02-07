import sys
from TokenTypes import *
from Token import *

class Lexer:

  def __init__(self,s):
    self._index = 0
    self._tokens = self.tokenize(s)

  def tokenize(self,s):
    result = []
    i = 0
    while i < len(s):
      c = s[i]
      if c == '(':
        result.append(Token(TokenTypes.LPAREN, "("))
        i = i + 1
      elif c == ')':
        result.append(Token(TokenTypes.RPAREN, ")"))
        i = i + 1
      elif c ==  '+':
        result.append(Token(TokenTypes.ADD, "+"))
        i = i + 1
      elif c ==  '-':
        result.append(Token(TokenTypes.SUB, "-"))
        i = i + 1
      elif c ==  '*':
        result.append(Token(TokenTypes.MUL, "*"))
        i = i + 1
      elif c ==  '/':
        result.append(Token(TokenTypes.DIV, "/"))
        i = i + 1
      elif c in ' \r\n\t':
        i = i + 1
        continue
      elif c.isdigit():
        j = i
        while j < len(s) and s[j].isdigit():
          j = j + 1
        result.append(Token(TokenTypes.INT,s[i:j]))
        i = j
      elif c == 'c':
       if s[i:i+3] == 'car':
        result.append(Token(TokenTypes.CAR,s[i:i+3]))
        i = i + 3
       elif s[i:i+3] == 'cdr':
        result.append(Token(TokenTypes.CDR,s[i:i+3]))
        i = i + 3
      else:
        print("UNEXPECTED CHARACTER ENCOUNTERED: "+c)
        sys.exit(-1)
    result.append(Token(TokenTypes.EOF, "-1"))
    return result

  def lex(self):
    t = None
    if self._index < len(self._tokens):
      t = self._tokens[self._index]
      self._index = self._index + 1
    print("Next Token is: "+str(t.get_token())+", Next lexeme is "+t.get_value())
    return t

