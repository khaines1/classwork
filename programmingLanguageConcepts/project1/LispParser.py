import ply.yacc as yacc
from LispLexer import tokens

#lisp rules
def p_lstart(p):
 'lstart : lisp SEMI'
 p[0] = p[1]

def p_lisp_1(p):
 'lisp : INT'
 p[0] = ['num',p[1]]

def p_lisp_2(p):
 'lisp : VAR'
 p[0] = ['var',p[1]]

def p_lisp_3(p):
 'lisp : LPAREN ADD lisp lisp RPAREN'
 p[0] = [p[2],p[3],p[4]]

def p_lisp_4(p):
 'lisp : LPAREN SUB lisp lisp RPAREN'
 p[0] = [p[2],p[3],p[4]]

def p_lisp_5(p):
 'lisp : LPAREN MUL lisp lisp RPAREN'
 p[0] = [p[2],p[3],p[4]]

def p_lisp_6(p):
 'lisp : LPAREN DIV lisp lisp RPAREN'
 p[0] = [p[2],p[3],p[4]]

def p_lisp_7(p):
 'lisp : LPAREN CAR list RPAREN'
 p[0] = ['car',p[3]]

#def p_lisp_8(p):
# 'lisp : LPAREN CDR list RPAREN'
# p[0] = ['cdr',p[3]]

#def p_lisp_9(p):
# 'lisp : LPAREN CONS list RPAREN'
# p[0] = [p[3]]

def p_lisp_8(p):
 'lisp : LPAREN LET LPAREN keyval RPAREN lisp RPAREN'
 p[0] = ['let',p[4],p[6]]

def p_lisp_9(p):
 'lisp : list'
 p[0] = p[1]

#keyval rules
def p_keyval_1(p):
 'keyval : LPAREN VAR lisp RPAREN'
 p[0] = [p[2],p[3]]

def p_keyval_2(p):
 'keyval : LPAREN VAR lisp RPAREN keyval'
 p[0] = [[p[2],p[3]],p[5]]

#list rules
#cdr removes first element of list
def p_list_1(p):
 'list : LPAREN CDR list RPAREN'
 p[0] = ['cdr',p[3]]

#cons adds an element to front of list
def p_list_2(p):
 'list : LPAREN CONS lisp list RPAREN'
 p[0] = [p[3],p[4]]

def p_list_3(p):
 'list : LPAREN seq RPAREN'
 p[0] = p[2]

#seq rules
def p_seq_1(p):
 'seq : lisp'
 p[0] = [p[1],[]]

def p_seq_2(p):
 'seq : lisp seq'
 p[0] = [p[1]]+[p[2]]

def p_error(p):
  print("Syntax error in input!")

parser = yacc.yacc()
