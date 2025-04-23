; Define possible states for hunger and energy as predicates
(hunger is_high)
(hunger is_low)
(energy is_high)
(energy is_low)

; Define concept nodes that will be used in the system
(= (ConceptNode)("hungry"))
(= (ConceptNode)("energy"))
(= (PredicateNode)("is high"))  
(= (PredicateNode) ("is low"))
; Define possible actions
(= (actionNode)("eating..."))
; Define the starting state label
(= (start_state)("Current State"))

; Define a rule that takes a context parameter $ch
(= (rule $ch)
      ( 
         ; First check if context is "test"
         if( == $ch test)
            (
                ; Check if hunger is high AND energy is low
                if ( == (and (match &self (hunger is_high) True) (match &self (energy is_low) True)) True )
                  (  
                        (start_state ) 
                     ("Needs's"( actionNode) ("So, Eating...") )
                  ) 
                  ( 
                      "Needs' Treatment it may health problem" 
                  ) 
            )
            (    
                   ; For non-test context, check if hunger is low AND energy is high
                   if ( == (and (match &self (hunger is_low) True) (match &self (energy is_high) True)) True )
                         ("Satisfied")  ; If satisfied
                         ("Not_correct")  ; Otherwise
                
            )
    )
 )
    
; Execute the rule with "test" context
!(rule test)
; Execute the rule with "result" context (though this parameter isn't explicitly handled)
!(rule result)
; Print completion message
!("Test is Completly Done") 