object Driver extends App {
  import Rational._
 
  val r0 = makeRational(1,0)
  val r1 = makeRational(-1,3)
  val r2 = makeRational(-1,-3)
  println(to_string(addRational(r1,r2)))
  println(to_string(subRational(r1,r2)))
  println(to_string(mulRational(r1,r2)))
  println(to_string(divRational(r1,r2)))
  println(equalRational(r1,r2)) 
  printRational(1,-6)
}
