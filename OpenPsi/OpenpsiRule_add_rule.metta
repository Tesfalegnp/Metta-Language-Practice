!(bind! &openpsi (new-space));Create Atom Space


(: And-Link(-> Symbol Expression Symbol Expression)) ; AndLink type
( = (And-Link $handle $context $action)
    (
        let*(
            ($return_ALink (AndLink $context $action))
            ($_ (add-atom &openpsi $return_ALink))
            )
            $return_ALink            
    )   
)

(: Implication-Link(-> Symbol Epression Expression Expression)) ; Implicationlink type
(=(Implication-Link $linkType $source $target)
    (
        let*
            (
                ($return_ILink (: $linkType (ImplicationLink $source $target)))
                ($_ (add-atom &openpsi $return_ILink))
                ; ($All_rule (match &openpsi (($return_ILink)) $return_ILink))
            )
            $return_ILink      
    )
)
(: AddRule(-> Symbol Expression Symbol Symbol Bool Expression))
(= (AddRule $handle $context $action $goal $TV)
    (  
          let*  (
                    ($ALink (And-Link $handle $context $action))
                    ($rule (Implication-Link $handle $ALink $goal))
                )
            $rule
    )
)

; ( = (is_rule $ptr ($c1 $c2) $action $goal))
( = (is_rule)
    (
        let* (
               ($rule (match &openpsi (: Home (ImplicationLink (AndLink (c1 c2) action) goal) ) (: Home (ImplicationLink (AndLink (c1 c2) action) goal) ) ))
            ;  ($rule (match &openpsi (: $ptr (ImplicationLink (AndLink ($c1 $c2) $action) $goal) ) (: $ptr (ImplicationLink (AndLink ($c1 $c2) $action) $goal) ) ))

            )
            $rule
            
    )
)

!(AddRule Home (c1 c2) action goal True) ; Add rule to the atom space

!(is_rule) ; it should return the rule





; !(add-atom &openpsi (A a))
; !(match &openpsi (A a) (A a)) 
; !(match &openpsi (: Home (ImplicationLink (AndLink (c1 c2) action) goal) ) (: Home (ImplicationLink (AndLink (c1 c2) action) goal) ) )
; !(size-atom  (collapse ( match &openpsi (: Home (ImplicationLink (AndLink (c1 c2) action) goal) ))))
