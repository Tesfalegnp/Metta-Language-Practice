; Create AtomSpace for OpenPsi
!(bind! &openpsi (new-space))  ; Creates a new AtomSpace to store OpenPsi states
!(match &openpsi $Value $Value)  ; Basic pattern matching in the space

; Initialize starting states in the AtomSpace,  Let say the Min and Max of each each Demand are 0 an 1 respictively  
!(add-atom &openpsi (Energy level 0.8))  
!(add-atom &openpsi (Hungry level 0.3))  

; Helper function to update atoms in the space
(= (update $space $old_atom $new_atom)
    (
        let $x (remove-atom $space $old_atom)  
               (add-atom $space $new_atom)     
    )
)

            ; Action to take when conditions are met - eating food to recover energy
(= (eat-food)
    (   
       ("Eating Food for Recovery Energy...")  ; Action message
       (update &openpsi (Energy level 0.3) (Energy level 0.9))  
       (update &openpsi (Hungry level 0.7) (Hungry level 0.2))  
    )    
)

; Context evaluation function - checks conditions and Call actions
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
!("After Recovered Hunger Level:-" (match &openpsi (Hungry level $x) $x))