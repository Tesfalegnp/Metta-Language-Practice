
(: add(-> Number Number Number))
( = (add $pre $next) (+ $pre $next ) ) ;Add Function


(: check (-> Number Number Number Number))
( = (check $range $pre $next)
    (
        let* 
            (
                ($pr $pre)
                ($nx $next)
                ($thrd (add $pr $nx))
                ($rng 200)

            )
            ( 
                if(< $range $nx)
                    ("end")
                    ($nx (check $range $nx $thrd))
            )
    )
)

(: fib(-> Number Number))
( = (fib $range)
 (  
    let*
        ( 
            ($pre 1)
            ($next 2)
            ($third (add $pre $next)) ;calling add function to get next number
        )
        (
            ($pre $next (check $range $next $third))
        )
 )
)
!(fib 10) ; test the code
!(fib 200) ; test the code
