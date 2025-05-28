(=(test ()) "End")
(=(test $expr)
        (let* 
            (   ($node1 (car-atom $expr))
                ($last (cdr-atom $expr))
                ($node2 (car-atom $last))
                ($sort (=(test2 $expr)
                        (
                          (let $x ( superpose $expr))
                          (let $x (superpose $expr) 
                          if(< $node1 $x)
                            ($node1)
                            ($x))
                        )
                )) ;Evaluate the scenario with the rule
            )
            ($sort $node1 $node2) ;Return the result of the scenario evaluation
         )      
)

!(test( 3 7 1 9 6))