; Create AtomSpace for OpenPsi
!(bind! &openpsi (new-space))  ; Creates a new AtomSpace to store OpenPsi states
!(match &openpsi $Value $Value)  ; Basic pattern matching in the space

; Initialize starting states in the AtomSpace,  Let say the Min and Max of each each Demand are 0 an 1 respictively  
!(add-atom &openpsi (Energy level 0.8))  
!(add-atom &openpsi (Hungry level 0.3))  

; Helper function to update atoms in the space
(: update(->hyperon::space::DynSpace Symbol Symbol)) ;Restruct Data Type for take space and Symoble then Return also Symbol
;Function
(= (update $space $old_atom $new_atom)
    (
        let $x (remove-atom $space $old_atom)  
               (add-atom $space $new_atom)     
    )
)


;; Function to simulate eating food and updating energy and hunger levels
(: eat-food (-> (List   ;
                String ;Action message
                (update &openpsi (Energy-level Float) (Energy-level Float)) ;Update energy level
                (update &openpsi (Hungry-level Float) (Hungry-level Float))  ;Update hunger level
               )))
;Function Recursion Method
(= (eat-food)
    (   let* ( 
                 ($energy-update (+ 0.3 0.3))  ; New energy level after eating food
                 ($hunger-update (- 0.7 0.2)) ; New hunger level after eating food
             )
             (  ("Eating Food for Recovery Energy...")  ; Action message
                ; ($energy-update)                ; Display updated energy level
                ; ($hunger-update)                ; Display updated hunger level
                ; (if(>= 0.9 $energy-update)  
 ;   ?          ;    (eat-food)                    ; Call the eat-food function recursively
                ;    (" Energy Level is Enough"))  
                ; (update &openpsi (Energy level 0.3) (Energy level $energy-update)) ;
                ; (update &openpsi (Hungry level 0.7) (Hungry level $hunger-update)) 
                (update &openpsi (Energy level 0.3) (Energy level 0.9))  
                (update &openpsi (Hungry level 0.7) (Hungry level 0.3)) 
             ) 
    )    
)

;; Context function to evaluate the current state and decide actions
;Data Type
(: context (-> (List 
               (update &openpsi (Energy level Float) (Energy level Float))
               (update &openpsi (Hungry level Float) (Hungry level Float))
               String  ; Energy level message
               String  ; Hunger level message
                 (Union 
                 (List String (update &openpsi ...))  ; eat-food branch ; May Here Some Question? is it right?
                 String
                 )
                )
            )
) ; "Enough Energy" branch
;Function
(= (context)
  ( 
      ;Simulate energy decrease during work
     (update &openpsi (Energy level 0.8) (Energy level 0.3))
     ; Simulate increased hunger during work
     (update &openpsi (Hungry level 0.3) (Hungry level 0.7))
     
     ; Display current states
     ("Energy Level during Work time " (match &openpsi (Energy level $x) $x))
     ("Hungry Level During Work Period :" (match &openpsi (Hungry level $x) $x))
     
     ; Rule: If energy is low (0.3) AND hunger is high (0.7), eat food
     (if (and (== (match &openpsi (Energy level $x) $x) 0.3) 
             (== (match &openpsi (Hungry level $x) $x) 0.7))
         (eat-food)  ; Call the Function
         ("Enough Energy have for the person")  ; Else case
     )
  )
)

; Main function to run the OpenPsi system
(= (run-openpsi)
    (
      (context)  ; Evaluate the context and trigger appropriate actions
    )
)

; Display section - shows the state before, during and after the OpenPsi run
!("==================================")
!("Before Start General(Normal Level) For:-")

!( "Energy Level:" (match &openpsi (Energy level $x) $x))
!( "Hungry Level:" (match &openpsi (Hungry level $y) $y))
!()
!("====================================")
!("During Work Period It convert to:-")
!(run-openpsi)  ; Execute the OpenPsi system
!()
!("====================================")
!("After Recovered Energy Level:-" (match &openpsi (Energy level $x) $x))
!("After Recovered Hunger Level:-" (match &openpsi (Hungry level $y) $y))