
( = (count $x)
   ( let*
        (($count (+ $x 1)))
         $count
   )
)
(= (ruc $range)
    (
        if(< $range 15)
        (
            let* 
                (
                    ($count (count $range))
                )
                (
                    :: $count (ruc $count)
                )
        )
        ("End")
    )
)
!(ruc 10)