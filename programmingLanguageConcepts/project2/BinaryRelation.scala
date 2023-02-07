object BinaryRelation {

  type BinaryRelation = (Int,Int) => Boolean
  type Element = (Int,Int)
  val bound = 99

  // returns an empty binary relation, i.e. no pairs
  def emptyBinaryRelation: BinaryRelation = 
     (x,y) => false

  // returns the universal binary relation, i.e. all pairs
  def universalBinaryRelation: BinaryRelation = 
     (x,y) => true

  // returns true of e is in r, false otherwise
  def contains(r: BinaryRelation, e: Element): Boolean = 
     r(e._1,e._2)

  // returns true if r1 is a subset of r2, false otherwise
  def subRelation(r1: BinaryRelation, r2: BinaryRelation): Boolean = {
    def helper1(x: Int): Boolean = {
      def helper2(y: Int): Boolean = {
        if (y > bound) true
        else if (contains(r1,(x,y)) && !contains(r2,(x,y))) false
        else helper2(y+1)
      }
      if (x > bound) true
      else if (!helper2(0)) false
      else helper1(x+1)
    }
    helper1(0)
  }
  
  // returns true of r1 equals r2, false otherwise
  def equal(r1: BinaryRelation, r2: BinaryRelation): Boolean = 
     subRelation(r1,r2) && subRelation(r2,r1)

  // returns a new binary relation obtained by adding e to r; if e already
  // is in r then returns r
  def add(r: BinaryRelation, e: Element): BinaryRelation = 
     (x,y) => if((x == e._1) && (y == e._2)) true else r(x,y)

  // for all a, (a,a) is in r
  def reflexive(r: BinaryRelation): Boolean = {
     def helper(x: Int): Boolean = {
      if(x > bound) true
      else if(!contains(r,(x,x))) false
      else helper(x + 1)
    }
    helper(0)
  }

  //def reflexive(r: BinaryRelation): Boolean = 
    // (0 to 99).toList.foldLeft(true)((b,i) => if(!r(i,i)) (b && false) else b)
  
// for all a,b, if (a,b) is in r then (b,a) is also in r
  def symmetric(r: BinaryRelation): Boolean = {
  def helper1(a: Int): Boolean = {
    def helper2(b: Int): Boolean = {
      if(b > bound) true
      else if(contains(r,(a,b)) && !contains(r,(b,a)))false
      else helper2(b + 1)
     }
    if(a > bound) true
    else if(!helper2(0)) false
    else helper1(a + 1)
   }
  helper1(0)
  }

  
  // for all a,b,c, if (a,b) is in r and (b,c) is in r then (a,c) is also in r
  def transitive(r: BinaryRelation): Boolean = {
   def helper1(a: Int): Boolean = {
    def helper2(b: Int): Boolean = {
      def helper3(c: Int): Boolean = {
        if(c > bound) true
        else if(contains(r,(a,b)) && contains(r,(b,c)) && !contains(r,(a,c)))false
        else helper3(c + 1)
      }
      if(b > bound) true
      else if(!helper3(0)) false
      else helper2(b + 1)
    }
    if(a > bound) true
    else if(!helper2(0)) false
    else helper1(a + 1)
   }
  helper1(0)
 }

  // equivalence relation is reflexive, symmetric, and transitive
  def equivalence(r: BinaryRelation): Boolean = 
     reflexive(r) && symmetric(r) && transitive(r)

  // For all a,b, if a != b and (a,b) in r then (b,a) is not in r
  def antisymmetric(r: BinaryRelation): Boolean = 
     if(symmetric(r)) false else true

  // returns set union of r1 and r2
  def union(r1: BinaryRelation, r2: BinaryRelation): BinaryRelation = {
     val allpairs = (for (i <- (0 to bound); j <- (0 to bound)) yield (i,j)).toList
     allpairs.foldLeft(emptyBinaryRelation) ((r,e) => 
        if (contains(r1,(e._1,e._2)) || contains(r2,(e._1,e._2))) add(r,e) 
        else r)
  
  }

  // returns inverse of r; inverse(r) = { (b,a) | (a,b) in r }
  def inverse(r: BinaryRelation): BinaryRelation = {
    val allpairs = (for (i <- (0 to bound); j <- (0 to bound)) yield (i,j)).toList
    allpairs.foldLeft(emptyBinaryRelation) ((res,e) =>                                       
         if (contains(r,(e._1,e._2)) && !contains(r,(e._2,e._1))) add(res,(e._2,e._1)) 
        else res)
  }  

  // look up definition in BinaryRelationNotes.pdf
  def reflexiveClosure(r: BinaryRelation): BinaryRelation = 
    ((0 to 99) zip (0 to 99)).foldLeft(r)((res,e) => add(res,e))

  // look up definition in BinaryRelationNotes.pdf
  def symmetricClosure(r: BinaryRelation): BinaryRelation = 
    union(r,inverse(r))
    
  
  // selfJoin will be useful in implementing transitiveClosure
  // returns a new relation { (a,c) | (a,b) is in r and (b,c) is in r }
  def selfJoin(r: BinaryRelation): BinaryRelation = {
    val rs = for {
      a <- 0 to bound
      b <- 0 to bound
      c <- 0 to bound
      if contains(r, (b,c)) && contains(r,(a,b)) 
    } yield ((a,c))
    rs.foldLeft(emptyBinaryRelation)((res,e) => add(res,e))
  }

  // look up definition in BinaryRelationNotes.pdf
  def transitiveClosure(r: BinaryRelation): BinaryRelation = 
    union(r,selfJoin(r))
  
  def toString(r: BinaryRelation): String = {
    val rs = for {
      i <- 0 to bound
      j <- 0 to bound
      if contains(r, (i, j)) 
    } yield ((i,j))
    rs.mkString("{", ",", "}")
  }

  def printBinaryRelation(r: BinaryRelation): Unit = {
    println(toString(r))
  }

}

