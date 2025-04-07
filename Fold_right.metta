; fold-right -- folds an expression from right to left using a function 
;E.g:   -- (fold-right add (1 2 3 4)) -> 10
        ; -- (fold-right and (True False False)) -> False

; For test case purpose
(= (& True True) True)
(= (& True False) False)
(= (& False True) False)
(= (& False False) False)


; Base case: empty list Assign
(= (fold-right - ()) 0)      ;Arthimatics
(= (fold-right & ()) True)  ; Identity for logical AND
; list with one element
(= (fold-left $operation (:: $x ())) $x)

; Test case with - And &
!(fold-right - ()) ; Output 0
!(fold-right & ()) ; Output True

; Recursive case: non-empty list
(= (fold-right $operation (:: $x $xs)) 
    ($operation $x (fold-right $operation $xs)))
        
 
; ; Test case with +
!(fold-right - (:: 1 (:: 2 (:: 3 (:: 4 (:: 8 (:: 9 ()))))))) ; Output -3

!(fold-right & (:: True (:: False (:: False ()))))  ;Output False


