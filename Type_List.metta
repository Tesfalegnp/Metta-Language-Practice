! (get-metatype 1) ; Grounded
! (get-metatype +) ; Grounded
! (get-metatype (+ 1 2)) ; Expression
! (get-metatype a) ; Symbol
! (get-metatype (a b)) ; Expression
! (get-metatype $x) ; Variable

(: a A)
(: foo (-> A B))
! (get-type (foo a)) ; B

