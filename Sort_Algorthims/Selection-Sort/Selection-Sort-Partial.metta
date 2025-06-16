; Selection Sort Algorithm in MeTTa

; --- Remove one occurrence of an element from the list
(: remove-one (-> (List $t) $t (List $t)))
(= (remove-one () $x) ())
(= (remove-one (List $x) ()) (List $x))
(= (remove-one (:: $h $t) $x)
   (if (== $h $x)
       $t
       (:: $h (remove-one $t $x))
   )
)

; ! (remove-one (:: "Genna" (:: "Kal" ())) "Kal") ;Expected (:: "Genna" ())

; --- Find the minimum number in a list
(: find-min (-> (List Number) Number))
(: find-min-helper (-> (List Number) Number Number))
(= (find-min (:: $h $t)) (find-min-helper $t $h))
(= (find-min ()) ())

(= (find-min-helper () $min) $min)
(= (find-min-helper (:: $h $t) $min)
   (if (< $h $min)
       (find-min-helper $t $h)
       (find-min-helper $t $min)
   )
)

; --- Selection sort implementation
(: selection-sort (-> (List Number ) Number (List Number)))
; (= (selection-sort ()) ())
(= (selection-sort () $new) ())
(= (selection-sort (:: $h $t) $new)
   (  
            let* ( 
                ($count (+ 1 $new)) 
                ($min (find-min (:: $h $t)))
                ($rest (remove-one (:: $h $t) $min))
                ) 
                ( 
                     let () (println! ($count)) ;; for check the work progress you can remove semicolen comment
                     (if (<= $count 4)
                         (:: $min (selection-sort $rest $count)) 
                         (:: $rest)
                     )
                        
                ) 
       
    
)
)

! (selection-sort (:: 34 (:: 12 (:: 1 (:: 13 (:: 1 ( :: 20 ( :: 18 (:: 16 ( :: 21 ()))))))))) 0)