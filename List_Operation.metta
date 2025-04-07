
;; ==========  Extract the last element of the list ==========

; Q1. Extract the last element of the list
(: List Type)
(: :: (-> $x List List))
(: () List)

(= (last-element (:: $x ())) (:: $x))  
(= (last-element (:: $x $y)) (last-element $y))  

! (last-element (:: 1 (:: 2 (:: 3 (:: 4 ())))))  
; Output: (4)


;; ==========  Add an element at the beginning ========== 

; Q2. Add an element at the beginning
(: append-begin (-> ($t List List)))
(= (append-begin $elem $lst) (:: $elem $lst))

! (append-begin 0 (:: 1 (:: 2 (:: 3 (:: 4 ())))))  
; Output: (:: 0 (:: 1 (:: 2 (:: 3 (:: 4 ()))))


;; ==========  Add an element at the end ========== 
; Q3. Add an element at the end

(= (append-end $elem ()) (:: $elem ()))
(= (append-end $elem (:: $x $y)) (:: $x (append-end $elem $y)))

! (append-end 5 (:: 1 (:: 2 (:: 3 (:: 4 ())))))  
; Output: (:: 1 (:: 2 (:: 3 (:: 4 (:: 5 ()))))))