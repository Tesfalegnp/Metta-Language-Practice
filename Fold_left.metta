;fold-left -- folds an expression from left to right using a function 

        ; Logical True For test case purpose
            (= (& True True) True)
            (= (& True False) False)
            (= (& False True) False)
            (= (& False False) False)

(= (fold-left - ()) 0) ;Empty list element
(= (fold-left & ()) True)  ;empty list logic

(= (fold-left $oper (:: $x ())) $x) ;for only one list element


;Recursive test
(= (fold-left $oper (:: $x (:: $y $xs))) 
    (fold-left $oper (:: ($oper $x $y) $xs)))

;for execution
!(fold-left - ()) ; Output 0

!(fold-left - (:: 0 (:: 2 (:: 4 (:: 6 (:: 8 (:: 10 ()))))))) ;Out put -30
!(fold-left & (:: True (:: False (:: True (:: True ())))))  ; Out put False 
