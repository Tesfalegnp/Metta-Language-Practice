;; Define the necessary types and constructors (as provided)
(: List (-> $a Type))
(: Nil (List $a))
(: Cons (-> $a (List $a) (List $a)))

(: Size Type)
(: mkSize (-> Number Size))

(: Instance Type)
(: mkInst (-> (List Number) Instance))

(: Pair (-> $a $b Type))
(: mkPair (-> $a $b (Pair $a $b)))

(: Cscore Type)
(: mkCscore (-> Number Number Cscore))

(: ScoredInstance (-> $score Type))
(: mkSInst (-> (Pair Instance $score) (ScoredInstance $score)))

(: InstanceSet (-> $score Type))
(: mkSInstSet (-> (List (ScoredInstance $score)) (InstanceSet $score)))

;; Helper function to extract the second component of Cscore from a ScoredInstance
(: get-second-score (-> (ScoredInstance Cscore) Number))
(= (get-second-score (mkSInst (mkPair $inst (mkCscore $first $second)))) $second)

;; Insert a ScoredInstance into a sorted InstanceSet
(: insert-sinst (-> (ScoredInstance Cscore) (List (ScoredInstance Cscore)) (List (ScoredInstance Cscore))))

(= (insert-sinst $x Nil) (Cons $x Nil))
(= (insert-sinst $x (Cons $y $ys))
    (if (<= (get-second-score $x) (get-second-score $y))
        (Cons $x (Cons $y $ys))
        (Cons $y (insert-sinst $x $ys))
    )
)

;; Insertion sort for InstanceSet
(: insertion-sort-iset (-> (List (ScoredInstance Cscore)) (List (ScoredInstance Cscore))))
(= (insertion-sort-iset Nil) Nil)
(= (insertion-sort-iset (Cons $x $xs))
    (insert-sinst $x (insertion-sort-iset $xs))
)

;; Wrapper function that takes and returns an InstanceSet
(: sort-instance-set (-> (InstanceSet Cscore) (InstanceSet Cscore)))
(= (sort-instance-set (mkSInstSet $lst))
    (mkSInstSet (insertion-sort-iset $lst))
)

! (sort-instance-set 
  (mkSInstSet 
    (Cons (mkSInst (mkPair (mkInst (Cons 10 Nil)) (mkCscore 10 50)))
    (Cons (mkSInst (mkPair (mkInst (Cons 9 Nil))  (mkCscore 9 25)))
    (Cons (mkSInst (mkPair (mkInst (Cons 8 Nil))  (mkCscore 8 40)))
    (Cons (mkSInst (mkPair (mkInst (Cons 7 Nil))  (mkCscore 7 10)))
    (Cons (mkSInst (mkPair (mkInst (Cons 6 Nil))  (mkCscore 6 70)))
    (Cons (mkSInst (mkPair (mkInst (Cons 5 Nil))  (mkCscore 5 15)))
    (Cons (mkSInst (mkPair (mkInst (Cons 4 Nil))  (mkCscore 4 35)))
    (Cons (mkSInst (mkPair (mkInst (Cons 3 Nil))  (mkCscore 3 60)))
    (Cons (mkSInst (mkPair (mkInst (Cons 2 Nil))  (mkCscore 2 5)))
    (Cons (mkSInst (mkPair (mkInst (Cons 1 Nil))  (mkCscore 1 20)))
          Nil))))))))))
    )
)

                            ;;The Expedcted Output Like
            ;;Expected Sorting Order by Cscore's second value
            
; (mkSInstSet 
;   (Cons (mkSInst (mkPair (mkInst (Cons 2 Nil))  (mkCscore 2 5)))
;   (Cons (mkSInst (mkPair (mkInst (Cons 7 Nil))  (mkCscore 7 10)))
;   (Cons (mkSInst (mkPair (mkInst (Cons 5 Nil))  (mkCscore 5 15)))
;   (Cons (mkSInst (mkPair (mkInst (Cons 1 Nil))  (mkCscore 1 20)))
;   (Cons (mkSInst (mkPair (mkInst (Cons 9 Nil))  (mkCscore 9 25)))
;   (Cons (mkSInst (mkPair (mkInst (Cons 4 Nil))  (mkCscore 4 35)))
;   (Cons (mkSInst (mkPair (mkInst (Cons 8 Nil))  (mkCscore 8 40)))
;   (Cons (mkSInst (mkPair (mkInst (Cons 10 Nil)) (mkCscore 10 50)))
;   (Cons (mkSInst (mkPair (mkInst (Cons 3 Nil))  (mkCscore 3 60)))
;   (Cons (mkSInst (mkPair (mkInst (Cons 6 Nil))  (mkCscore 6 70)))
;         Nil))))))))))
; )