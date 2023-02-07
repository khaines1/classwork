import scala.math.abs
object Rational {

type Rational = (Int, Int)

def gcd(n: Int, d: Int): Int = {
  if (d == 0) n
  else if(n < 0 && d < 0) gcd(-d, -n % -d)
  else if(n < 0) gcd(d, -n % d)
  else gcd(d, n % d)
}
 
//def gcd(a: Int, b: Int): Int =
  //  if (b == 0) a else gcd(b, a%b)


def makeRational(n: Int, d: Int): Rational = {
 
   if(d < 0 && n < 0){
     val divisor = gcd(n,d)
     (-n/divisor,-d/divisor)
   }
   else if(d < 0){
     val divisor = gcd(n,d)
     (-n/divisor,-d/divisor)
   }
   else{
     val divisor = gcd(n,d)
     (n/divisor,d/divisor)
   }
}
/*
def makeRational(n:Int, d:Int): Rational = {
    if (d == 0)
        throw new Exception("Divide by 0")
    val g = gcd(abs(n),abs(d))
    if (((n >= 0) && (d >= 0)) || ((n < 0) && (d < 0)))
        (abs(n)/g,abs(d)/g) 
    else
        (-abs(n)/g,abs(d)/g)
}*/

def numer(r: Rational): Int = r._1

def denom(r: Rational): Int = r._2

def addRational(r1: Rational, r2: Rational): Rational = {
  makeRational(
    ((numer(r1) * denom(r2)) + (numer(r2) * denom(r1))),
    (denom(r1) * denom(r2))
  )
}

def subRational(r1:Rational,r2:Rational): Rational = {
  makeRational(
    ((numer(r1) * denom(r2)) - (numer(r2) * denom(r1))),
    (denom(r1) * denom(r2))
  )
}

def mulRational(r1:Rational,r2:Rational): Rational = {
  makeRational(
    (numer(r1) * numer(r2)),
    (denom(r1) * denom(r2))
  )
}

def divRational(r1:Rational,r2:Rational): Rational = {
  makeRational(
    (numer(r1) * denom(r2)),
    (denom(r1) * numer(r2))
  )
}

def equalRational(r1:Rational,r2:Rational): Boolean = 
      numer(r1) * denom(r2) == denom(r1) * numer(r2)

def to_string(r: Rational): String = {
  val s = "%d/%d" 
  s.format(r._1,r._2)
}

def printRational(r: Rational): Unit =
  println(to_string(r))

}
