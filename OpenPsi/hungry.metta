(hunger is_high)
(hunger is_low)
(energy is_high)
(energy is_low)

( = (ConceptNode)("hungry"))
( = (ConceptNode)("energy"))
( = (PridactNode)("is high"))
( = (PridactNode) ("is low"))
( = (actionNode)("eat"))
( = (start_state)("Current State"))



( = (rule $ch)
      ( 
         if( == $ch test)
            (
                if ( == (and (match &self (hunger is_high) True) (match &self (energy is_low) True)) True )
                  (  (start_state ) 
                     ("Needs's"( actionNode) ("So, Eating...") )
                  )
                  ( 
                        "Needs' Treatment it may health problem"
                  ) 
            )
            (    
                   if ( == (and (match &self (hunger is_low) True) (match &self (energy is_high) True)) True )
                         ("Satisfied")
                         ("Not_correct")
                
            )
    )
 )
    
!(rule test)
!(rule result)
!("Test is Completly Done")


