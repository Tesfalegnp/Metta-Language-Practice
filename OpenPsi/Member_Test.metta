;  Option 1 Your Code 
(: isMember (-> $a $aa Bool))
(= (isMember $x $list)
    (not (== (collapse (intersection (superpose ($x)) (superpose $list))) ()))
)

(= (allTested $actions $tested)
   (if (== $actions ())
     $tested
     (let ($head $tail) (decons-atom $actions)
       (if (isMember $head $tested)
         (allTested $tail $tested)
         (allTested $tail (cons-atom $head $tested))
         )
      )
     )
   )


; Option 2  Trying other option
(: MemberList(->Expression Expression Expression))
(= (MemberList $test $list)
    ( collapse (unique (union (superpose $test) (superpose $list)))   )
)



; third Option 3
(= (MemberList_sort $test $list)
    (sort (collapse (unique (union (superpose $test) (superpose $list))) ))
)

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

;    Test

!(allTested (1 21 4 7 5 6 8) (5 7 8 9)) 
!(MemberList (1 21 4 7 5 6 8) (5 7 8 9))
!(MemberList_sort (1 21 4 7 5 6 8) (5 7 8 9))




