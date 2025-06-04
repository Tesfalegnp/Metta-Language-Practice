
    ; Selection Sorting Algorthim

(: remove (->  (List $t) $t (List $t)))
(= (remove () $x) ())
(= (remove (List $x) ()) (List $x))

(= (remove (:: $h $t) $x)
    (if (== $h $x) $t (:: $h (remove $t $x)))
)
! (remove (:: "Genna" (:: "Kal" ())) "Kal" )

(: findMin (-> (List Number) Number))
(: helper (->  (List Number) Number Number))
(= (findMin (:: $h $t)) (helper $t $h))
(= (findMin ()) ())

(= (helper () $min) $min) ;If the list Empty
(= ( helper (:: $h $t) $min)
    (if (< $h $min) 
     (helper $t $h)
     (helper $t $min)
    )
)


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
! (sorts (:: 12 (:: 34 (:: 1 (:: 13 (:: 1 ()))))))
