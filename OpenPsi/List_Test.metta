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


!(allTested (1 2 4 7 5 6 8) (5 7 8 9)) 


; Option 2  Trying other option

(: MemberList(->Expression Expression Expression))
(= (MemberList $test $list)
    (
        collapse (unique (union (superpose $test) (superpose $list)))
    )
)
!(MemberList (1 2 4 7 5 6 8) (5 7 8 9))






; !(allTested (60 50) (3 5 6)) 

; !(unique (superpose (a b c d d))) ; Returns [a, b, c, d]





;  !(intersection (1 3) (3 6))  

; !(superpose (collapse ((superpose (2 4 3)) (superpose (4 5 2 1)))))



; !(collapse(superpose (A B C s 6 o)))
; (= (bin) 0)
; (= (bin) 1)
; !(collapse-bind (bin)) ;

