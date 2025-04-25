!(bind! &openpsi (new-space));Create Atom Space

!(add-atom &openpsi (ImplicationLink Hell How_are_you))  ; This is for check the Atom Space is it correctly Can add!
;
; This function creates a rule by adding an AndLink for context and action
; (: AndLink(-> String String Bool)) 
; (=(AndLink $x $y)
;     (if(and $x $y)
;           True
;           False
;   )
; )

; (: ImplicationLink(-> Bool String String)) ; Implicationlink type
;(=(ImplicationLink $x $y)
;  (
;    if(== $x True)
;         $y   ;Goal
;        "Does Not Meet The Goal " ;Out of goal
;  )
;)
;
;;; Example usage for add_rule
; (: add_rule(->String String String Bool Bool))
(=(add-rule $context $action $goal $TV)
    (let* 
        (     
            ; Create AndLink with context and action And ImplicationLink 
            ($hca (AndLink $context $action))
            ($rule (ImplicationLink $hca $goal))
            (add-atom &openpsi $rule)
        )
        ; Set truth value for the rule
        (if ( == $rule $goal)
          (add-atom &openpsi $rule)
          (empty)
        )
      )
)

!(add-rule True True "Goal meet" T); Like to Test May Test Not correct, I am Not Sure it!

!(match &openpsi ($z $x $y)  $y)
