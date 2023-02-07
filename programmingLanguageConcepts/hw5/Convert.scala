object Convert{

 def convertNum2Binary(num: Int): String = {
   if(num == 0) "0"
   else if(num == 1) "1"
   else{
     convertNum2Binary(num/2) + num % 2
   }
}


 def convertFraction2Binary(num: Double): String = {
   val current = (num * 2)
   val rem = (current % 2).asInstanceOf[Int]

   if (num == 0) ""
   else {
     "" + rem + convertFraction2Binary(current - rem) 
   }
 }

 def main(args: Array[String]): Unit = {
   println(convertNum2Binary(100))
   println(convertFraction2Binary(0.375))
   println(convertFraction2Binary(0.8))
 }
}
/* Solution
def convertNum2Binary(num: Int): String =
    if (num <= 1) num.toString
    else convertNum2Binary(num/2)++(num%2).toString

def convertFraction2Binary(num: Double): String = {
    def helper(num: Double, res: String): String = {
      if (res.length >= 23) res
      else
        if (num*2 == 1) 
          res++"1"
        else if (num*2 < 1) 
          helper(num*2,res++"0") 
        else
          helper(num*2-1.0,res++"1")
    }
    "."++helper(num,"")
}
*/
