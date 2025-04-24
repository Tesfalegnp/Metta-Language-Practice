; This function creates a rule by adding an AndLink for context and action
; (: AndLink(-> String String Bool)) 
(=(AndLink ($x $y)
      if(and $x $y)
          True
          False
  )
)
; (: ImplicationLink(-> Bool String String)) ; Implicationlink type
(=(ImplicationLink $x $y)
  (
    if(== $x True)
         $y   ;Goal
        "Not Mutch" ;Out of goal
  )
)
;;; Example usage for add_rule
(=(add-rule $context, $action, $goal, $TV)
    (let* 
        (
            ; Create AndLink with context and action And ImplicationLink 
            ($hca (AndLink ($context $action)))
            ($rule (ImplicationLink $hca $goal))
        )
        ; Set truth value for the rule
        ($rule)
      
    )
)

!(add-rule "5" "5" 10 3)