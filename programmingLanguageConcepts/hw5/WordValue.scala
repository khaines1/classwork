object WordValue{
  def wordValue(s: String): Int = {
   if (s.length == 0) 0
   else {
    val head = s.head
    val tail = s.tail
    (head.asDigit - 9) + wordValue(tail)
   }
  }

  def main(args: Array[String]){
   println(wordValue("Attitude"))
  } 
}

/*
def ord(c: Char): Int =
  c.toInt - 'a'.toInt + 1

def wordValue(s: String): Int = {
    if (s == "") 0 
    else ord(s.toLowerCase().charAt(0)) + wordValue(s.toLowerCase().substring(1))
}
wordValue("Attitude")
*/
