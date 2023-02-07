object Driver extends App {
  import WAE._

  val e1 = WAENode(nodeType="num",numValue=2.5)
  val e2 = WAENode(nodeType="id",idValue="x")
  val e3 = WAENode(nodeType="+",
                 child1=WAENode(nodeType="num",numValue=2.5),
                 child2=WAENode(nodeType="num",numValue=4.5)
                )
  val e4 = WAENode(nodeType="+",
                 child1=WAENode(nodeType="num",numValue=2.5),
                 child2=WAENode(nodeType="*",
                                child1=WAENode(nodeType="num",numValue=3.5),
                                child2=WAENode(nodeType="num",numValue=2.0)
                               )
                )
  val e5 = WAENode(nodeType="if",
                 child1=WAENode(nodeType="num",numValue=2.5),
                 child2=WAENode(nodeType="num",numValue=4.5),
                 child3=WAENode(nodeType="num",numValue=5.5)
                )

  val e6 = WAENode(nodeType="if",
                 child1=WAENode(nodeType="num",numValue=0.0),
                 child2=WAENode(nodeType="num",numValue=4.5),
                 child3=WAENode(nodeType="*",
                                child1=WAENode(nodeType="num",numValue=3.5),
                                child2=WAENode(nodeType="num",numValue=2.0)
                               )
                )

  val e7 = WAENode(nodeType="with",
                 vars=List(("X",WAENode(
                   nodeType="with",
                   vars=List(("Y",WAENode(nodeType="num",numValue=3.0))),
                   child1=WAENode(nodeType="+",
                                  child1=WAENode(nodeType="id",idValue="Y"),
                                  child2=WAENode(nodeType="id",idValue="Y")
                                 )
                 ))),
                 child1=WAENode(nodeType="+",
                                child1=WAENode(nodeType="id",idValue="X"),
                                child2=WAENode(nodeType="id",idValue="X")
                               )
                )

  val e8 = WAENode(nodeType="with",
                 vars=List(("X",WAENode(nodeType="num",numValue=2.0)),
                           ("Y",WAENode(nodeType="num",numValue=3.0))),
                 child1=WAENode(nodeType="with",
                                vars=List(("X",WAENode(nodeType="with",
                                                       vars=List(
                           ("X",WAENode(nodeType="num",numValue=8.0)),
                           ("Y",WAENode(nodeType="num",numValue=10.0))
                                                                ),
                                                       child1=WAENode(nodeType="+",
                                               child1=WAENode(nodeType="id",idValue="X"),
                                               child2=WAENode(nodeType="id",idValue="Y")
                                                                     )
                                                      )),
                                          ("Z",WAENode(nodeType="num",numValue=5.0))),
                                child1=WAENode(nodeType="+",
                                               child1=WAENode(nodeType="id",idValue="X"),
                                               child2=WAENode(nodeType="id",idValue="Y")
                                              )
                               )
                ) 

  val e9 =
  WAENode(
      nodeType="with",
      child1=WAENode(nodeType="+",
                     child1=WAENode(
                         nodeType="with",
                         child1=WAENode(nodeType="id",idValue="X"),
                         vars=List(("X",WAENode(nodeType="num",numValue=10.0)),
                                   ("Z",WAENode(nodeType="num",numValue=20.0)))
                     ),
                     child2=WAENode(
                         nodeType="*",
                         child1=WAENode(
                             nodeType="+",
                             child1=WAENode(nodeType="id",idValue="X"),
                             child2=WAENode(nodeType="id",idValue="Y")
                         ),
                         child2=WAENode(nodeType="id",idValue="Z")
                     )
      ),
      vars=List(("X",WAENode(nodeType="num",numValue=3.0)),
                ("Y",WAENode(nodeType="num",numValue=4.0)),
                ("Z",WAENode(nodeType="num",numValue=5.0)))
  )

val e10 = WAENode(nodeType="+",
child1=WAENode(nodeType="+",
child1=WAENode(nodeType="num",numValue=2)
,
child2=WAENode(nodeType="num",numValue=3)
)
,
child2=WAENode(nodeType="num",numValue=4)
)

val e11 = WAENode(nodeType="with",
vars=List(("x",WAENode(nodeType="num",numValue=5)
),
("y",WAENode(nodeType="num",numValue=2)
)
),
child1=WAENode(nodeType="-",
child1=WAENode(nodeType="id",idValue="x")
,
child2=WAENode(nodeType="id",idValue="y")
)
)


  val d = Map[String,Double]()

  println(eval(e1,d))
  //println(eval(e2,d))
  println(eval(e3,d))
  println(eval(e4,d))
  println(eval(e5,d))
  println(eval(e6,d))
  println(eval(e7,d))
  println(eval(e8,d))
  println(eval(e9,d))
  println(eval(e10,d))
  println(eval(e11,d))
}
