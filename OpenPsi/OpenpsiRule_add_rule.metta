!(bind! &openpsi (new-space));Create Atom Space


; (: And-Link(-> Expression String String)) ; AndLink type
( = (And-Link $handle $context $action)
    (
        let*(
            ($return_ALink (AndLink $context $action))
            ($_ (add-atom &openpsi $return_ALink))
            )
            ($return_ALink)            
    )   
)

; (: Implication-Link(-> Expression String String)) ; Implicationlink type
(=(Implication-Link $handle $andLink $goal)
    (
        let*
            (
                ($return_ILink (ImplicationLink $andLink $goal))
                ($_ (add-atom &openpsi $return_ILink))
            )
            $return_ILink       
    )
)
; (: AddRule(-> Symbol Expression Symbol Symbol Bool Symbol))
(= (AddRule $handle $context $action $goal $TV)
    (  
          let*  (
                    ($ALink (And-Link $handle $context $action))
                    ($rule (Implication-Link $ALink $goal))
                )
            $rule
    )
)
; !(AddRule goal (c1 c2) h h True)

!(AddRule Home (c1 c2) action goal True)

!(match &openpsi(ImplicationLink $y $x) (ImplicationLink $y $x))



