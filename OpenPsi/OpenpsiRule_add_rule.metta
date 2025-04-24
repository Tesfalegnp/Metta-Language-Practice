;;; Define add_link function
(=(add-link $AndLink $temp_c)
    (type, handles)
    (cond
        ((not (is-link type)) (error "Invalid link type"))
        (else (create-link type handles))
    )
)
(=(AndLink ($x $y)
      if(and $x $y)
          True
          False
  )
)
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

!(add-rule 5 1 0.8 0.9)