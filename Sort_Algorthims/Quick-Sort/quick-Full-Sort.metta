; ---------------------
; Quick Sort Definitions

; Type Declarations
(: quick-sort (-> (List Number) Number (List Number)))
(: partition-less (-> Number (List Number) (List Number)))
(: partition-greater-eq (-> Number (List Number) (List Number)))
(: append (-> (List Number) (List Number) (List Number)))

; Base case
(= (quick-sort () $count_next) ())

; Recursive case
(= (quick-sort (:: $pivot $rest) $intial)
   (
      let* (
        ($count_next (+ 1 $intial))
       ($less (partition-less $pivot $rest))
       ($greater-eq (partition-greater-eq $pivot $rest))
       ($sorted-less (quick-sort $less $count_next))
       ($sorted-greater-eq (quick-sort $greater-eq $count_next))
   )
       (let ()(println! $count_next);; to check manually working progress
        (append $sorted-less (:: $pivot $sorted-greater-eq)))
   )
)

; --- Partition helpers

; Elements < pivot
(= (partition-less $pivot ()) ())
(= (partition-less $pivot (:: $h $t))
   (if (< $h $pivot)
       (:: $h (partition-less $pivot $t))
       (partition-less $pivot $t)
   )
)

; Elements >= pivot
(= (partition-greater-eq $pivot ()) ())
(= (partition-greater-eq $pivot (:: $h $t))
   (if (>= $h $pivot)
       (:: $h (partition-greater-eq $pivot $t))
       (partition-greater-eq $pivot $t)
   )
)

; Append lists
(= (append () $lst2) $lst2)
(= (append (:: $h $t) $lst2) (:: $h (append $t $lst2)))

; ---------------------
;  Test
! (quick-sort (:: 34 (:: 12 (:: 1 (:: 13 (:: 1 (:: 20 (:: 18 (:: 16 (:: 21 ()))))))))) 0)