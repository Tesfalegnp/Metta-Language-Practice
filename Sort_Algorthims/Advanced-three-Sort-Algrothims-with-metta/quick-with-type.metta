;; --------------------------
;; Type Declarations (from your code)
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

;; --------------------------
;; Helper: extract second value from Cscore
(: get-second-score (-> (ScoredInstance Cscore) Number))
(= (get-second-score (mkSInst (mkPair $inst (mkCscore $first $second)))) $second)

;; --------------------------
;; Quick Sort for ScoredInstance
(: quick-sort-sinst (-> (List (ScoredInstance Cscore)) Number (List (ScoredInstance Cscore))))

; Base case
(= (quick-sort-sinst Nil $intial) Nil)

; Recursive case
(= (quick-sort-sinst (Cons $pivot $rest) $intial)
   (let* (
            ($count_next (+ $intial 1))
            ($less (partition-less-sinst $pivot $rest))
            ($greater-eq (partition-greater-eq-sinst $pivot $rest))
        )
    
        ( let () (println! $count_next)
            (append-sinst (quick-sort-sinst $less $count_next) (Cons $pivot (quick-sort-sinst $greater-eq $count_next)))
        )
   )
)

;; Partition into elements with second score < pivot
(: partition-less-sinst (-> (ScoredInstance Cscore) (List (ScoredInstance Cscore)) (List (ScoredInstance Cscore))))
(= (partition-less-sinst $pivot Nil) Nil)
(= (partition-less-sinst $pivot (Cons $x $xs))
   (if (< (get-second-score $x) (get-second-score $pivot))
       (Cons $x (partition-less-sinst $pivot $xs))
       (partition-less-sinst $pivot $xs)
   )
)

;; Partition into elements with second score >= pivot
(: partition-greater-eq-sinst (-> (ScoredInstance Cscore) (List (ScoredInstance Cscore)) (List (ScoredInstance Cscore))))
(= (partition-greater-eq-sinst $pivot Nil) Nil)
(= (partition-greater-eq-sinst $pivot (Cons $x $xs))
   (if (>= (get-second-score $x) (get-second-score $pivot))
       (Cons $x (partition-greater-eq-sinst $pivot $xs))
       (partition-greater-eq-sinst $pivot $xs)
   )
)

;; Append two ScoredInstance lists
(: append-sinst (-> (List (ScoredInstance Cscore)) (List (ScoredInstance Cscore)) (List (ScoredInstance Cscore))))
(= (append-sinst Nil $ys) $ys)
(= (append-sinst (Cons $x $xs) $ys) (Cons $x (append-sinst $xs $ys)))

;; --------------------------
;; Wrapper function for sorting an InstanceSet
(: sort-instance-set-quick (-> (InstanceSet Cscore) (InstanceSet Cscore)))
(= (sort-instance-set-quick (mkSInstSet $lst))
   (mkSInstSet (quick-sort-sinst $lst 0))
)

;; --------------------------
;;  Test Case
! (sort-instance-set-quick 
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
))
