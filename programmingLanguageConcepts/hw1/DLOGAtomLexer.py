import ply.lex as lex

tokens = ['NAME','NUMBER','STRING','LPAREN','RPAREN','COMMA']

t_LPAREN = r'\('
t_RPAREN = r'\)'
t_COMMA = r','

def t_NAME(t):
  r'[a-zA-Z][_a-zA-Z0-9]*'
  t.type = 'NAME'
  return t

def t_NUMBER(t):
  r'[0-9]+'
  t.value = int(t.value) 
  t.type = 'NUMBER'
  return t

def t_STRING(t):
  r'"[a-zA-Z][_a-zA-Z0-9]*"'
  t.type = 'STRING'
  return t

# Ignored characters
t_ignore = " \r\n\t"
t_ignore_COMMENT = r'\#.*'

def t_error(t):
  print("Illegal character '%s'" % t.value[0])
  #t.lexer.skip(1)
  raise Exception('LEXER ERROR')

lexer = lex.lex()
## Test it out
#data = 'p(x,20,x,y,"john",x,y)'
#
## Give the lexer some input
#print("Tokenizing: ",data)
#lexer.input(data)
#
## Tokenize
#while True:
#    tok = lexer.token()
#    if not tok: 
#        break      # No more input
#    print(tok)
