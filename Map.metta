;map -- applies a function to all the contents of an expression

; Map means It make New form like give one Don't change the form  

(= (double $x)(* $x 2))
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

!(map double (1 2 3 4 5))  ; Output (2 4 6 8 10)