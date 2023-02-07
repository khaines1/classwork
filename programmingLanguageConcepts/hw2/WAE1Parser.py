import ply.yacc as yacc
import sys
from WAELexer import tokens

def p_waeStart(p):
  'waeStart : wae SEMI'
 # p[0] = p[1] 
  if (p[1] == False):
   p[0] = False
  else:
   p[0] = True

def p_wae_1(p):
  'wae : NUMBER' 

def p_wae_2(p):
  'wae : ID' 

def p_wae_3(p):
  'wae : LBRACE PLUS wae wae RBRACE' 
  p[0] = p[4]

def p_wae_4(p):
  'wae : LBRACE MINUS wae wae RBRACE' 
  p[0] = p[4]

def p_wae_5(p):
  'wae : LBRACE TIMES wae wae RBRACE' 
  p[0] = p[4]

def p_wae_6(p):
  'wae : LBRACE DIV wae wae RBRACE' 
  p[0] = p[4]

def p_wae_7(p):
  'wae : LBRACE IF wae wae wae RBRACE'

def p_wae_8(p):
  'wae : LBRACE WITH LBRACE alist RBRACE wae RBRACE'
  if len(p[4]) == len(set(p[4])):
   p[0] = True
  else:
   p[0] = False

def p_alist_1(p):
  'alist : LBRACE ID wae RBRACE'
  p[0] = [p[2]]

def p_alist_2(p):
  'alist : LBRACE ID wae RBRACE alist'
  p[0] = [p[2]] + p[5]

def p_error(p):
  print("Syntax error in input!")

parser = yacc.yacc()

