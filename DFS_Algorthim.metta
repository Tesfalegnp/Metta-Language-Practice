; ; ;;; Define DFS for binary tree equality (structure + values)

; ; (: Tree Type)
; (: dfs (-> (List Number) (List Number) Bool)) ;; Define DFS function type

; (= (dfs () ()) True)  ;; Base case: both trees are empty

; ;; One is empty, one is not
; ; (= (dfs () $a) False)
; ; (= (dfs $v ()) False)

; ; Match only 3-element node tuples
; (= (dfs ($v1 $l1 $r1) ($v2 $l2 $r2))
;     (if (== $v1 $v2)
;         ( if ( dfs $l1 $l2)
;                 (dfs $r1 $r2)
;                 False
;         )
;         False
;         )
; )
; ;; Test — expected All output: [()]

; !(assertEqual (dfs ( 1 (2 () ()) (3 () ()) ) ( 1 (2 () ()) (3 () ()) )) True )
; !(assertEqual (dfs ( 1 (2 () ()) (1 () ()) ) ( 1 (1 () ()) (2 () ()) )) False)
; !(assertEqual (dfs ( 1 2 () ) ( 1 () 2 )) False )


;                    ; It Comparing like in visual reperesentation
;             ;       1                 1
;             ; 1,  /  \      =        / \
;             ;    2    3             2   3


;             ; 2,    1                 1
;             ;     /  \     =         / \
;             ;    2    1            1    2


;             ; 3,   1                  1
;             ;     /       =            \
;             ;    2                      2



    ; ###################################################
    ;                  This Is other Option
    ; $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
; Base case: both are empty trees
(= (dfs () ()) True)

(= (dfs $x $y)
    ( if(== (car-atom $x)(car-atom $y))
            (dfs (cdr-atom $x)(cdr-atom $y))
            False
    )
)

                ;;  Test cases
!(assertEqual (dfs (1 (2 () ()) (3 () ())) (1 (2 () ()) (3 () ()))) True)
!(assertEqual (dfs (1 (2 () ()) (1 () ())) (1 (1 () ()) (2 () ()))) False)
!(assertEqual (dfs (1 2 ()) (1 () 2)) False)

