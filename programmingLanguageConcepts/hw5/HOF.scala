object HOF{
  def compose(f: Int => Int, g: Int => Int): Int => Int =
    x => f(g(x))

  def repeated(f: Int => Int, n: Int): Int => Int = {
    if(n <= 0) x => x
    else x => repeated(f,n-1)(f(x))
  }
/*def repeated(f:Int=>Int,n:Int): Int=>Int = {
    if (n == 1) f
    else compose(f,repeated(f,n-1))
}*/
  def main(args: Array[String]){
    println("compose: " + compose(x=>x*x, x=>x+1)(6))
    println("repeated: " + repeated(x=>3*x,4)(8))
  }
}
