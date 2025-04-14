;; ================================
;; Function: test-rule
;; Arguments:
;;   $scenario: Function (Predicate -> Atom) - A function that evaluates a rule.
;;   $rule: String - The name of the rule to test.
;; Returns:
;;   String - "Rule conditions met. Executing action..." if successful,
;;            "undiscovered" otherwise.
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
;; Function: AndLink
;; Arguments:
;;   $n: Boolean - First condition to check.
;;   $k: Boolean - Second condition to check.
;; Returns:
;;   Boolean - True if both $n and $k are True, False otherwise.
(= (AndLink $val1 $val2)
  (if (== $val1 True)
    (if (== $val2 True)
      True ;; Both conditions are True
      False ;; Second condition is False
    )
    False ;; First condition is False
  )
)

;; ================================
;; Function: test-senario
;; Arguments:
;;   $rule: String - The name of the rule to test.
;; Returns:
;;   String - "Correctly matched the rule..." if successful,
;;            "undiscovered" otherwise.
(= (test-senario $rule)
  (if (== $rule "drunk-when-thrust") ;; Check if the rule matches the expected name
    (if (== (AndLink True True) True) ;; Test the AndLink function
      "Correctly matched the rule...\n" ;; Output when the rule matches
      "undiscovered-1" ;; Output when the rule does not match
    )
    "undiscovered" ;; Output when the rule does not match
  )
)

;; ================================
;; Test the AndLink function
;; Expected Output: True
!(AndLink True True)

;; ================================
;; Execute the test-rule function with the test-senario and rule name
;; Expected Output: "Correctly matched the rule..."
!(test-rule test-senario "drunk-when-thrust")

;; ================================
;; Print completion message
!("Test is Completed")

;; ================================
;; Test the AndLink function again with example input
;; Expected Output: True
!(AndLink True True)