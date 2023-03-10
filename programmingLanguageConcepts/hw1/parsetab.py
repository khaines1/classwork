
# parsetab.py
# This file is automatically generated. Do not edit.
# pylint: disable=W,C,R
_tabversion = '3.10'

_lr_method = 'LALR'

_lr_signature = 'COMMA LPAREN NAME NUMBER RPAREN STRINGatom : NAME LPAREN args RPARENargs : args COMMA argargs : argarg : NUMBERarg : STRINGarg : NAME'
    
_lr_action_items = {'NAME':([0,3,10,],[2,4,4,]),'$end':([1,9,],[0,-1,]),'LPAREN':([2,],[3,]),'NUMBER':([3,10,],[7,7,]),'STRING':([3,10,],[8,8,]),'RPAREN':([4,5,6,7,8,11,],[-6,9,-3,-4,-5,-2,]),'COMMA':([4,5,6,7,8,11,],[-6,10,-3,-4,-5,-2,]),}

_lr_action = {}
for _k, _v in _lr_action_items.items():
   for _x,_y in zip(_v[0],_v[1]):
      if not _x in _lr_action:  _lr_action[_x] = {}
      _lr_action[_x][_k] = _y
del _lr_action_items

_lr_goto_items = {'atom':([0,],[1,]),'args':([3,],[5,]),'arg':([3,10,],[6,11,]),}

_lr_goto = {}
for _k, _v in _lr_goto_items.items():
   for _x, _y in zip(_v[0], _v[1]):
       if not _x in _lr_goto: _lr_goto[_x] = {}
       _lr_goto[_x][_k] = _y
del _lr_goto_items
_lr_productions = [
  ("S' -> atom","S'",1,None,None,None),
  ('atom -> NAME LPAREN args RPAREN','atom',4,'p_atom','DLOGAtomParser.py',5),
  ('args -> args COMMA arg','args',3,'p_args_1','DLOGAtomParser.py',9),
  ('args -> arg','args',1,'p_args_2','DLOGAtomParser.py',13),
  ('arg -> NUMBER','arg',1,'p_arg_1','DLOGAtomParser.py',17),
  ('arg -> STRING','arg',1,'p_arg_2','DLOGAtomParser.py',21),
  ('arg -> NAME','arg',1,'p_arg_3','DLOGAtomParser.py',25),
]
