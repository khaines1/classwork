object WAE {

  abstract class Node

  case class WAENode(
    nodeType: String, // will be "num", "id", "+", "-", "*", "/", "if", or "with"
    numValue: Double = 0.0, // used to store num value
    idValue: String = "", // used to store id value
    child1: WAENode = null, // used for if, with, +, -, *, /
    child2: WAENode = null, // used for if, +, -, *, /
    child3: WAENode = null, // used for if
    vars: List[(String,WAENode)] = List[(String,WAENode)]() // used for with
  ) extends Node

  
 def eval(e: WAENode, d: Map[String,Double]): Double = e match{ 
   case nodeType if(e.nodeType == "num") => e.numValue
   case nodeType if(e.nodeType == "id") => if(!d.isEmpty) d(e.idValue) 
                                          else throw new Exception("empty dectionary")   
   
   case nodeType if(e.nodeType == "+") => eval(e.child1,d) + eval(e.child2,d)
   case nodeType if(e.nodeType == "-") => eval(e.child1,d) - eval(e.child2,d)
   case nodeType if(e.nodeType == "*") => eval(e.child1,d) * eval(e.child2,d)
   case nodeType if(e.nodeType == "/") => eval(e.child1,d) / eval(e.child2,d)
   
   case nodeType if(e.nodeType == "if") => if(eval(e.child1,d) != 0) eval(e.child2,d)
                                          else eval(e.child3,d)
   case nodeType if(e.nodeType == "with") => 
   {
     val vals = e.vars.map(x => (x._1,eval(x._2,d)))
     //println(vals)
     
     val newDict = vals.foldLeft(d)((m,v) => m + v) 
     //println(newDict)
  
     eval(e.child1,newDict)
   }
   
 }

}
