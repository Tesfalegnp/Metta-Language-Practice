;; ================================
(: ConceptNode Type) 
(: PredicateNode Type)
(: ActionNode Type) 
(: EvaluationLintk Type)

(= (high_tem)(PredicateNode "tem_high"))
(= (is_aDayTime)(PredicateNode "is_daytime"))
(= (room_cold)(ConceptNode "room cold"))


(: test-rule(->List List List))
(= (test-rule $scenario $rule) 
  (if (== $rule "drunk-when-thrust") ;; Check if the rule matches the expected name
    (let* (
        ($x ($scenario $rule)) ;; Evaluate the scenario with the rule
      )
      ($x) ;; Return the result of the scenario evaluation
    )
    "undiscovered-first" ;; Return "undiscovered" if the rule does not match
  )
)

;; ================================
(: AndLink(-> Bool Bool Bool))
;; This function takes two boolean values and returns True if both are True, otherwise False.
(= (AndLink $val1 $val2)
  (if (and (== $val2 True) (== $val1 True))
      True ;; Both conditions are True
      False ;; Second condition is False
  )
)

;; ================================
;; Test Scenario
(: test-senario (-> String Bool))
;; This function takes a rule name and returns True if the rule matches "drunk-when-thrust", otherwise False.
(= (test-senario $rule)
  (if (== $rule "drunk-when-thrust") ;; Check if the rule matches the expected name
    (if (== (AndLink ( high_tem) (is_aDayTime)) True) ;; Test the AndLink function
      "Correctly matched the rule...\n" ;; Output when the rule matches
      "undiscovered-Last" ;; Output when the rule does not match
    )
    "undiscovered" ;; Output when the rule does not match
  ) 
)



!(test-rule test-senario "drunk-when-thrust")

;; Print completion message
!("Test is Completed")
