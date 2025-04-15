;; ================================
(= (test-rule $scenario $rule)
  (if (== $rule "drunk-when-thrust") ;; Check if the rule matches the expected name
    (let* (
        ($x ($scenario $rule)) ;; Evaluate the scenario with the rule
      )
      ($x) ;; Return the result of the scenario evaluation
    )
    "undiscovered" ;; Return "undiscovered" if the rule does not match
  )
)

;; ================================
(= (AndLink $val1 $val2)
  (if (and (== $val2 True) (== $val1 True))
      True ;; Both conditions are True
      False ;; Second condition is False
  )
)

;; ================================
;; Test Scenario
(= (test-senario $rule)
  (if (== $rule "drunk-when-thrust") ;; Check if the rule matches the expected name
    (if (== (AndLink True True) True) ;; Test the AndLink function
      "Correctly matched the rule...\n" ;; Output when the rule matches
      "undiscovered-1" ;; Output when the rule does not match
    )
    "undiscovered" ;; Output when the rule does not match
  ) 
)



!(test-rule test-senario "drunk-when-thrust")

;; ================================
;; Print completion message
!("Test is Completed")

;; ================================
;; Test the AndLink function again with example input
;; Expected Output: True
!(AndLink True True)