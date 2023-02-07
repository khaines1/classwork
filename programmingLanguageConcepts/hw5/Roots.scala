import scala.math.abs
import scala.math.pow
import scala.math.cos
import scala.math.exp
object Roots {
  val tolerance = 0.0001

  def isCloseEnough(x: Double, y: Double) =
    abs((x-y)/x) < tolerance

  def fixpoint(f: Double => Double)(firstGuess: Double) = {
    def iterate(guess: Double): Double = {
        val next = f(guess)
        println(next)
        if (isCloseEnough(guess, next)) next
        else iterate(next)
    }
    iterate(firstGuess)
   }

  def roota = fixpoint(x => scala.math.pow(x+10,0.25))(1.0)
  def rootb = fixpoint(x => cos(x)/exp(x))(2.0)

  def main(args: Array[String]){
    println("roota: " + roota)
    println("rootb: " + rootb)
  }
}
