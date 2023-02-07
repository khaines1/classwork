import ply.lex as lex

tokens = ['NUMBER','STRING','LBRACE','RBRACE','LBRACKET','RBRACKET','COMMA','COLON','SEMI']

t_LBRACE = r'\{'
t_RBRACE = r'\}'
t_LBRACKET = r'\['
t_RBRACKET = r'\]'
t_COMMA = r','
t_COLON = r':'
t_SEMI = r';'

def t_NUMBER(t):
  r'[0-9]+'
  t.value = int(t.value) 
  t.type = 'NUMBER'
  return t

def t_STRING(t):
  r'"[ _a-zA-Z0-9]*"'
  t.type = 'STRING'
  return t

# Ignored characters
t_ignore = " \r\n\t"
t_ignore_COMMENT = r'\#.*'

def t_error(t):
  print("Illegal character '%s'" % t.value[0])
  t.lexer.skip(1)
  raise Exception('LEXER ERROR')

lexer = lex.lex()
## Test it out
#data = '{ "street" : "123 main street", "city"   : "Atlanta", "state"  : "Georgia", "zip"    : "30303" };'
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
