import ply.lex as lex

reserved = {'car': 'CAR', 'cdr': 'CDR','let': 'LET', 'cons': 'CONS'}
tokens = ['INT','VAR','LPAREN','RPAREN', 'SEMI','ADD','SUB','MUL','DIV'] +\
 list(reserved.values())

t_LPAREN = r'\('
t_RPAREN = r'\)'
t_SEMI = r';'
t_CAR = r'car'
t_CDR = r'cdr'
t_LET = r'let'
t_CONS = r'cons'
t_ADD = r'\+'
t_SUB = r'-'
t_MUL = r'\*'
t_DIV = r'/'

def t_NUMBER(t):
  r'[-+]?[0-9]+(\.([0-9]+)?)?'
  t.value = float(t.value)
  t.type = 'INT'
  return t

def t_VAR(t):
  r'[a-zA-Z][_a-zA-Z0-9]*'
  t.type = reserved.get(t.value.lower(),'VAR')
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
#data = '''(let ((x 2)(y 4)) (+ x y))


## Give the lexer some input
#print("Tokenizing: ",data)
#lexer.input(data)

## Tokenize
#while True:
#    tok = lexer.token()
#    if not tok: 
#        break      # No more input
#    print(tok)

