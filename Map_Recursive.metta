;map -- applies a function to all the contents of an expression
;        -- (map half (2 4 6 )) -> (1 2 3)

(= (half $x) (/ $x 2))
; !(half 2)

(= (map $func $expr)
    (if (== $expr ())
        ()
        (let* (
            ($head (car-atom $expr))
            ($tail (cdr-atom $expr))
            ($recursive-head ($func $head))
            ($recursive-tail (map $func $tail))
            )
            (cons-atom $recursive-head $recursive-tail)
        )
    )   
)

; (=(half $x) (/ $x 2))

; (=(map $fun $ex)
;    ( 
;       if(== $ex ())
;         ()
;         (let*(
;                 ($head (car-atom $ex))
;                 ($tail (cdr-atom $ex))
;                 ($rec-head ($fun $head))
;                 ($rec-tail (map $fun $tail)) 
;              )
;            (cons-atom $rec-head $rec-$tail)
;         )
;    )
; )
; Test case

!(map half (2 4 6))

!(map half ())

!(map half (10))
