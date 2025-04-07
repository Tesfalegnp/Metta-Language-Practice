; Define foreach
; (= (foreach $action $expr)
;     (if (== $expr ())
;         ()
;         (let* 
;             (
;              !("hel")   
;               ($head (car-atom $expr))
;               ($tail (cdr-atom $expr))
;               ($action $head)
;             )
;             (foreach $action $tail)
;         )
;     )
; )




(= (foreach $func $expr)
    (if (== $expr ())
        ()
        (let* (
            ($head (car-atom $expr))
            ($tail (cdr-atom $expr))
            ($recursive-head ($func $head))
            ($recursive-tail (foreach $func $tail))
            )
            (cons-atom $recursive-head $recursive-tail)
        )
    )   
)


; Define a function to print elements
(= (print-element $x) ($x)) ; Print Each value



; Test foreach
!(foreach print-element (10 20 30 40))

; Define a function to log elements
(= (log-element $x)($x) ; Log the current element
)

!(foreach log-element ("red" "green" "blue"))
