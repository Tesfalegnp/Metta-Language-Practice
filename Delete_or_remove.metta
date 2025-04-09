; deleting Some Data form given Data

; (: remove (->  (List $t) $t (List $t))); Type for remove

; (= (remove () $x) ()) ;If list empty Return Empty

; (= (remove (List $x) ()) (List $x)) ;if list have only one element return empty

; (= (remove (:: $h $t) $x) ; if list more than one element remove needed element and return remain 
;     (if (== $h $x) $t (:: $h (remove $t $x)))
; )

; ; To Test the code 
; ($h ("Kal"))
; ! (remove (:: "Genna" (:: "Kal" (:: "Bob" ()))) "Kal" ) ;Expected out of "Kal"

(: remove (->  (List $t) $t (List $t)))
(= (remove () $x) ())
(= (remove (List $x) ()) (List $x))

(= (remove (:: $h $t) $x)
    (if (== $h $x) $t (:: $h (remove $t $x)))
)

! (remove (:: "Genna" (:: "Kal" (::"Bob" ()))) "Kal" ) ;For Delete
