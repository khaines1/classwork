import ply.yacc as yacc
from JSONLexer import tokens

def p_jstart(p):
 'jstart : json SEMI'
 p[0] = True

def p_json_1(p):
 'json : STRING'

def p_json_2(p):
 'json : NUMBER'

def p_json_3(p):
 'json : LBRACE objlist RBRACE'

def p_json_4(p):
  'json : LBRACKET jsonlist RBRACKET'

def p_objlist_1(p):
 'objlist : objlist COMMA pair'

def p_objlist_2(p):
 'objlist : pair'

def p_pair(p):
 'pair : STRING COLON json'

def p_jsonlist_1(p):
 'jsonlist : jsonlist COMMA json'

def p_jsonlist_2(p):
 'jsonlist : json'

def p_error(p):
  print("Syntax error in input!")

parser = yacc.yacc()
