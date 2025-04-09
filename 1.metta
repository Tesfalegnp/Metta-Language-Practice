(: remove (->  (List $t) $t (List $t)))
(= (remove () $x) ())
(= (remove (List $x) ()) (List $x))

(= (remove (:: $h $t) $x)
    (if (== $h $x) $t (:: $h (remove $t $x)))
)

! (remove (:: "Genna" (:: "Kal" (::"Bob" ()))) "Kal" ) ;For Delete

(: findMin (-> (List Number) Number))
(: helper (->  (List Number) Number Number))
(= (findMin (:: $h $t)) (helper $t $h))
(= (findMin ()) ())

(= (helper () $min) $min)
(= ( helper (:: $h $t) $min)
    (if (< $h $min) (helper $t $h) (helper $t $min)))


(= (sorts ()) ())
(= (sorts (:: $h $t))
    (let* (
            ($min (findMin (:: $h $t)))
            ($removedList (remove (:: $h $t) $min))
        )
    (let () (println! ($removedList))
        (:: $min (sorts $removedList))
    )
)
)
; ! (sorts (:: 312 (:: 64 (:: 1 (:: 13 (:: 41 ())))))) ;Sorting
! (sorts (:: 31 (:: 4 ()))) ;Sorting