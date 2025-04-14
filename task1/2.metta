;; ================================
;; Define Contexts
;; These are conditions that must be true for the rule to apply.
(= context-thirsty
  (EvaluationLink
    (PredicateNode "is-thirsty")         ;; Predicate: The agent is thirsty.
    (ListLink (ConceptNode "agent"))     ;; Argument: The agent itself.
  )
)

(= context-water-available
  (EvaluationLink
    (PredicateNode "water-available")    ;; Predicate: Water is available.
    (ListLink (ConceptNode "location-kitchen")) ;; Argument: Location (kitchen).
  )
)

;; ================================
;; Define Action
;; This is what the agent will do if the contexts are met.
(= action-drink
  (ExecutionLink
    (SchemaNode "drink")                 ;; Schema: The action of drinking.
    (ListLink (ConceptNode "water-item"));; Argument: The water item to drink.
  )
)

;; ================================
;; Define Goal
;; This is what the agent wants to achieve by performing the action.
(= goal-not-thirsty
  (EvaluationLink
    (PredicateNode "not-thirsty")        ;; Predicate: The agent is no longer thirsty.
    (ListLink (ConceptNode "agent"))     ;; Argument: The agent itself.
  )
)

;; ================================
;; Define Psi-Rule
;; This rule combines contexts, action, and goal into an implication.
(= drink-when-thirsty-rule
  (ImplicationLink
    (AndLink                           ;; Combine multiple contexts with AND.
      context-thirsty                  ;; Context: Agent is thirsty.
      context-water-available          ;; Context: Water is available.
    )
    action-drink                        ;; Action: Drink the water.
    goal-not-thirsty                    ;; Goal: Become not thirsty.
  )
)

;; ================================
;; Test Scenario
;; Simulate a situation where the agent is thirsty and water is available.
(= test-scenario
  (AndLink
    (EvaluationLink
      (PredicateNode "is-thirsty")       ;; Condition: Agent is thirsty.
      (ListLink (ConceptNode "agent"))
    )
    (EvaluationLink
      (PredicateNode "water-available")  ;; Condition: Water is available.
      (ListLink (ConceptNode "location-kitchen"))
    )
  )
)

;; ================================
;; Function to Test the Rule
;; This function checks if the rule's conditions are met and executes the action.
(= test-rule
  (lambda (scenario rule)
    (if (== (cog-execute! scenario)     ;; Check if the scenario matches the rule's context.
            (cog-execute! (get-context rule)))
        (begin                          ;; If conditions are met:
          (display "Rule conditions met. Executing action...\n")
          (cog-execute! (get-action rule)) ;; Execute the action.
          (display "Goal achieved.\n")
        )
        (display "Rule conditions not met.\n") ;; If conditions are not met.
    )
  )
)

;; ================================
;; Helper Functions
;; These functions extract parts of the rule for easier processing.

;; Get the context part of the rule.
(= get-context
  (lambda (rule)
    (gar rule) ;; Extract the first part of the ImplicationLink (context).
  )
)

;; Get the action part of the rule.
(= get-action
  (lambda (rule)
    (gdr rule) ;; Extract the last part of the ImplicationLink (action).
  )
)


;; Run the test-rule function with the test scenario and the rule name.
!(test-rule test-scenario drink-when-thirsty-rule)

;; Print completion message
!("Test is Completed")

!(AndLink True True) ;; Expected Output: True

 
 