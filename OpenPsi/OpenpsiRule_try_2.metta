; ================================
; Type declarations for OpenPSI nodes
(: ConceptNode Type) 
(: PredicateNode Type)
(: ActionNode Type) 
(: EvaluationLintk Type)

; Node definitions for temperature and time conditions
(= (high_tem)(PredicateNode "tem_high"))
(= (is_aDayTime)(PredicateNode "is_daytime"))
(= (room_cold)(ConceptNode "room cold"))


; Rule testing function
(: test-rule(->List $List1 $List2))
(= (test-rule $scenario $rule) 
  (if (== $rule "drunk-when-thrust") ;Check if the rule matches the expected name
    (let* 
      (
        ($x ($scenario $rule)) ;Evaluate the scenario with the rule
      )
      ($x) ;Return the result of the scenario evaluation
    )
    "Not mutch with Rule " ;Return, if the rule does not match
  )
)

;================================
;Logical AND operation for OpenPSI
(: AndLink(-> String String Bool))
(= (AndLink $val1 $val2)
  (if (and (== $val1 high_tem) (== $val2 is_aDayTime))
      True ; Both conditions are True
      False ; Second condition is False
  )
)

;================================
;Test scenario function
(= (test-senario $rule)
  (
    if (== $rule "drunk-when-thrust") ;Check if the rule matches the expected name
    (
      if (== (AndLink high_tem is_aDayTime) True) 
      "Correctly Satisfied the rule..." ;Output when the rule matches
      "Unsatisfied" ;Output when the rule does not match
    )
    "UnMatch with Senarion" ;Output when the rule does not match
  ) 
)

;Execute the test rule with test scenario
!(test-rule test-senario "drunk-when-thrust")

;Print completion message
!("Test is Completed")

