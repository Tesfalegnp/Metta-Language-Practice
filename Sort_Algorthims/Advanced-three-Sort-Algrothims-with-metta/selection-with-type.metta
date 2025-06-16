;; --- Type Definitions ---
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

;; --- get-second-score ---
(: get-second-score (-> (ScoredInstance Cscore) Number))
(= (get-second-score (mkSInst (mkPair $inst (mkCscore $first $second)))) $second)

;; --- find-min-sinst-helper ---
(: find-min-sinst-helper (-> (List (ScoredInstance Cscore)) (ScoredInstance Cscore) (ScoredInstance Cscore)))
(= (find-min-sinst-helper Nil $current-best-min) $current-best-min)
(= (find-min-sinst-helper (Cons $h $t) $current-best-min)
   (if (< (get-second-score $h) (get-second-score $current-best-min))
       (find-min-sinst-helper $t $h)
       (find-min-sinst-helper $t $current-best-min)
   )
)

(: find-min-sinst (-> (List (ScoredInstance Cscore)) (ScoredInstance Cscore)))
(= (find-min-sinst (Cons $h $t)) (find-min-sinst-helper $t $h))

;; --- remove-sinst (corrected with full equality) ---
(: remove-sinst (-> (ScoredInstance Cscore) (List (ScoredInstance Cscore)) (List (ScoredInstance Cscore))))
(= (remove-sinst $e Nil) Nil)
(= (remove-sinst $e (Cons $h $t))
   (if (== $e $h)
       $t
       (Cons $h (remove-sinst $e $t))
   )
)

;; --- selection-sort-sinst-list ---
(: selection-sort-sinst-list (-> (List (ScoredInstance Cscore)) Number (List (ScoredInstance Cscore))))
(= (selection-sort-sinst-list Nil $counter) Nil)
(= (selection-sort-sinst-list (Cons $elem $list) $counter)
   (let* (
           ($min-elem (find-min-sinst (Cons $elem $list)))
           ($rest (remove-sinst $min-elem (Cons $elem $list)))
           ($next-counter (+ $counter 1))
         )
        (let () (println! ($next-counter))
           (Cons $min-elem (selection-sort-sinst-list $rest $next-counter))
        )
   )
)


;; --- Final wrapper ---
(: sort-instance-set (-> (InstanceSet Cscore) (InstanceSet Cscore)))
(= (sort-instance-set (mkSInstSet $lst))
   (mkSInstSet (selection-sort-sinst-list $lst 0))
)

;;  Final Test Case

!(sort-instance-set
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
; ;; Expected: Sorted InstanceSet by increasing second score