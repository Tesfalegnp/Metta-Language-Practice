                                          ;;Atom
; Symbol atoms
apple
banana  
!(get-type apple)   ;%undefined%
!()
; Number atoms
!(get-type(42))    ;Number
!(get-type(3.14159))    ;Number
!()
                                           ;Expression
    ; Simple expression
!(get-type(+ 1 2))
; Nested expression
!(get-type (* (+ 1 2) (- 5 3)))
!(get-type +)

                                            ;Variable
!(get-type $x)  ;$Undefined%
                                            ; Ground
    
!(get-type "hello")  ;String
!(get-type True)     ;Bool
!(get-type 1)        ;Number
                                            ;List
!()
; Simple list
!(get-type (1 2 3 4))

; Mixed-type list
!(get-type ("apple" 42 True $x))



                                            ; Value Assign
(= $count 10) 
(= $y 7)                                      ;
!(count) ;Out put is 10, 7 But Can hold any assinged value!As imparative Language Not correct