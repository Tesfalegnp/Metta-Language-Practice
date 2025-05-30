
(: sort(->Expression Expression))
(= (sort ()) ; If List Empty
    ()
)
(= (sort $list)
    (
        let* (

            ($min (min-atom $list))
            ($remain (subtraction-atom $list ($min)))
            ($next (sort $remain))
            )
            (cons-atom $min $next)
    )
)


;; Test

!(sort (7 8 2 6 3 9 1 4 5))
; !(sort (abebe zer mamo))  ;; the function for only number! This function not working
