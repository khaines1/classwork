object Driver extends App {
  import BinaryRelation._
 
  val s1 = List((1,5),(2,8),(3,9))
  val r1 = (s1 foldLeft emptyBinaryRelation)((r,e)=>add(r,e))
  val r2 = (((0 to bound) zip (0 to bound)) foldLeft emptyBinaryRelation)((r,e)=>add(r,e))
  val s3 = List((2,5),(2,8),(3,10))
  val r3 = (s3 foldLeft emptyBinaryRelation)((r,e)=>add(r,e))
  val s4 = List((1,2),(2,3),(3,4),(4,5))
  val r4 = (s4 foldLeft emptyBinaryRelation)((r,e)=>add(r,e))
  val r5 = add(add(add(add(emptyBinaryRelation,(1,5)),(5,1)),(1,1)),(5,5))

  printBinaryRelation(r1)
  println(reflexive(r1))
  println(reflexive(r2))
  println(symmetric(r1))
  println(transitive(r1))
  printBinaryRelation(inverse(r1))
  printBinaryRelation(union(r1,r3))
  printBinaryRelation(symmetricClosure(r1))
  printBinaryRelation(reflexiveClosure(r1))
 // printBinaryRelation(selfJoin(r4))
 // printBinaryRelation(transitiveClosure(r4))

}
