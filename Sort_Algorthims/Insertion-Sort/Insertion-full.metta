; Insertion Sort Algorithm in MeTTa

; --- Insert an element into a sorted list at the correct position
(: insert (-> Number (List Number) (List Number)))
(= (insert $x ()) (:: $x ()))
(= (insert $x (:: $y $ys))
    (if (<= $x $y)
        (:: $x (:: $y $ys))
        (:: $y (insert $x $ys))
    )
)

; --- Insertion sort implementation
(: insertion-sort (-> (List Number) (List Number)))
(= (insertion-sort ()) ())
(= (insertion-sort (:: $x $xs))
    (insert $x (insertion-sort $xs))
)

; Test cases (uncomment one at a time)
; ! (insert 3 (:: 1 (:: 2 (:: 4 ())))) ; Should return (:: 1 (:: 2 (:: 3 (:: 4 ()))))
! (insertion-sort (:: 12 (:: 34 (:: 1 (:: 13 (:: 1 (:: 99 (:: 0 ())))))))) 
; Should return (:: 0 (:: 1 (:: 1 (:: 12 (:: 13 (:: 34 (:: 99 ())))))))