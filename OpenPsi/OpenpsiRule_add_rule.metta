!(bind! &openpsi (new-space));Create Atom Space
;
( = (OpenPsiRules) &openpsi)
!(add-atom (OpenPsiRules) (PredicateNode action executed) )


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
( = (add-rule $context $action $goal $TV)
    (let* 
        (     
            ; Create AndLink with context and action And ImplicationLink 
            ($hca (add-atom (OpenPsiRules) (AndLink $context $action)))
            ($rule (add-atom (OpenPsiRules) (ImplicationLink $hca $goal)))
          
        )
        $rule

        ; Set truth value for the rule
        ; (
        ;   if ( == $rule $goal)
        ;   (add-atom &self $rule)
        ;   (empty)
        ; )
      )
)

; !(add-rule True True "Goal meet" T); Like to Test May Test Not correct, I am Not Sure it!
!(add-rule True True True True)


!(match &openpsi (AndLink $x $y)  $y)
!(match &openpsi (ImplicationLink $x $y) $y)


!(match &openpsi $x $y)





            ;General Structure
; [impelementationLink (AndLink (context Action)) goal]