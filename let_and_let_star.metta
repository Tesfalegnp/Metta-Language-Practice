; let funtion use for binding temporary value to variable
!(let $x (+ 6 7) (* $x 8) ) ;104

; let* function use for takes two expressions and binds the first to a variable, then evaluates the second expression using that variable.
!( let*(
        ($x (- 9 3))
        ($y (+ $x 2))
        ($z (* $y 4))
        )
        ("X:" $x , "Y:" $y "Z:" $z); print
)