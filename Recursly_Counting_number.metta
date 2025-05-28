
( = (count $x)
   ( let*
        (($count (+ $x 1)))
         $count
   )
)
(= (ruc $range)
    (
        if(< $range 15) ;Bounder for the Counting
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
!(ruc 0); It count Up to 15 Number