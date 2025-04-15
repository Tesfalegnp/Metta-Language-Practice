;; ================================
;; Define Contexts
;; These are conditions that must be true for the rule to apply.
(= context-hungry
  (EvaluationLink
    (PredicateNode "is-hungry")          ;; Predicate: The agent is hungry.
    (ListLink (ConceptNode "agent"))     ;; Argument: The agent itself.
  )
)

(= context-food-available
  (EvaluationLink
    (PredicateNode "food-available")     ;; Predicate: Food is available.
    (ListLink (ConceptNode "location-kitchen")) ;; Argument: Location (kitchen).
  )
)

;; ================================
;; Define Action
;; This is what the agent will do if the  contexts are met.
(= action-eat
  (ExecutionLink
    (SchemaNode "eat")                   ;; Schema: The action of eating.
    (ListLink (ConceptNode "food-item")) ;; Argument: The food item to eat.
  )
)

;; ================================
;; Define Goal
;; This is what the agent wants to achieve by performing the action.
(= goal-not-hungry
  (EvaluationLink
    (PredicateNode "not-hungry")         ;; Predicate: The agent is no longer hungry.
    (ListLink (ConceptNode "agent"))     ;; Argument: The agent itself.
  )
)

;; ================================
;; Define Psi-Rule
;; This rule combines contexts, action, and goal into an implication.
(= eat-when-hungry-rule
  (ImplicationLink
    (AndLink                           ;; Combine multiple contexts with AND.
      context-hungry                   ;; Context: Agent is hungry.
      context-food-available           ;; Context: Food is available.
    ) 
    action-eat                         ;; Action: Eat the food.
    goal-not-hungry                    ;; Goal: Become not hungry.
  )
)

;; ================================
;; Test Scenario
;; Simulate a situation where the agent is hungry and food is available.
(= (test-scenario
  (AndLink 
    (EvaluationLink
      (PredicateNode "is-hungry")       ;; Condition: Agent is hungry.
      (ListLink (ConceptNode "agent"))
    )
    (EvaluationLink
      (PredicateNode "food-available")  ;; Condition: Food is available.
      (ListLink (ConceptNode "location-kitchen"))
    )
  ))
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

;; ================================
;; Run the Test
;; Execute the test-rule function with the test scenario and the rule.
!(test-rule test-scenario eat-when-hungry-rule)

;; Print completion message
!("Test completed.")