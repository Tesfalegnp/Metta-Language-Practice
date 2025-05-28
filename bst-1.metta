(= (order () ) "No List Value") ; If search not found 
(=(order $exp) 
    (  
        let*
         (   
            ($head (car-atom $exp))
            ($tail (cdr-atom $exp))
            ($head-2 (car-atom $tail))
            ($left (if(>= $head $head-2)
                        ($head)
                        (
                            ;  if(== $tail ())
                            ; (order $tail)
                            ; ("End")
                        )       
                    )
            )
            ($right (if(<= $head $head-2)
                        ($head)
                        (
                          if(== (cdr-atom $tail) ())
                            (order $tail)
                            ("End")
                        )
                   )
            )
            ; ($result (if(== $key $head)
            ;   True  ;if search Value Found it return
            ;   (order $tail $key)
            ; ))  
         ) ; Epression Value for Let *
         ($left $right) ;Return Value for let * 
    )
)
!(order( 6 5 4 1 8 5 3 4 6 2))

; implemented by Tesfalegn @iCog-Labs