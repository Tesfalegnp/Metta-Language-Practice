; Partial Insertion Sort in MeTTa - Sorts first k elements, leaves rest unchanged

; --- Insert helper function (same as standard insertion sort)
(: insert (-> Number (List Number) (List Number)))
(= (insert $x ()) (:: $x ()))
(= (insert $x (:: $y $ys))
    (if (<= $x $y)
        (:: $x (:: $y $ys))
        (:: $y (insert $x $ys))
    )
)

; --- Partial insertion sort (sorts first k elements)
(: partial-insertion-sort (-> (List Number) Number (List Number)))
(= (partial-insertion-sort () $k) ()) ; Empty list case
(= (partial-insertion-sort $lst 0) $lst) ; k=0 returns original
(= (partial-insertion-sort (:: $x $xs) $k)
    (let* (
        ($sorted-rest (partial-insertion-sort $xs (- $k 1))))
        (if (> $k 0)
            (insert $x $sorted-rest)
            (:: $x $xs) ; When k=0, stop sorting
        )
    )
)

; Test cases
! (partial-insertion-sort (:: 5 (:: 2 (:: 4 (:: 1 (:: 0 (:: 9 ())))))) 3) 
; Expected: (:: 2 (:: 5 (:: 8 (:: 1 (:: 4 (:: 9 ()))))) (first 3 sorted))

! (partial-insertion-sort (:: 12 (:: 34 (:: 1 (:: 13 (:: 1 (:: 99 (:: 0 ()))))))) 4)
; Expected: (:: 1 (:: 12 (:: 13 (:: 34 (:: 1 (:: 99 (:: 0 ()))))) (first 4 sorted)))