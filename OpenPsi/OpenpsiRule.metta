
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
( = (add_category $handle $new_category)
        (
         let*
            ( 
                ($exist (match &openpsi (: $handle (INHERITANCE_LINK $new_category)) (: $handle (INHERITANCE_LINK $new_category))))
                ($return (
                             if (== (size-atom $exist) 0)
                                (
                                   let* (
                                        ($category (: $handle (INHERITANCE_LINK $new_category))) ;it maynot work correctly Be check more MemberLink and InheritanceLink
                                        ($_ (add-atom &openpsi $category))
                                        )
                                        ($category)
                                )
                                ( 
                                    (: $handle (INHERITANCE_LINK $new_category))
                                ))) ) 
                   $return
        )
)

(: add_to_Category(->Symbol Expression Symbol Expression))
( = (add_to_Category $handle $rule $category)
    (
        let* (
                ($_ (add-atom &openpsi (MEMBER_LINK $rule $category))); i depende in C++ code But MemberLink should be InheritanceLink.
                ($_ (add_category $handle $category))
            )
            $rule
    )
)
( = (get-category())
    (
        ;How Can i retrive all data from Created Atom Space, I am not sure here to implement this code
        ;Please Could you helpe me here?
    )
)
(: getContext(->Expression Symbol))
( = (getContext $rule)
    (
        let*
            (
             ($x (match &openpsi (: $handle (ImplicationLink (AndLink $context $action) $goal)) $context))
             ($ptr ( if($x)
                        ((get-type $x))
                        (%Undefined%) )
             )
            )
            $ptr
    )
)

(: getAction (->Expression Symbol))
( = (getAction $rule)
    (
        let*
            (
             ($x (match &openpsi (: $handle (ImplicationLink (AndLink $context $action) $goal)) $action))
             ($ptr (if($x)
                        ((get-type $x))
                        (%Undefined%) )
             )
            )
            $ptr
    )
)

(: getGoal(->Expression Symbol))
( = (getGoal $rule)
    (
        let*
            (
             ($x (match &openpsi (: $handle (ImplicationLink (AndLink $context $action) $goal)) $goal))
             ($ptr (if($x)
                        ((get-type $x))
                        (%Undefined%) )
             )
            )
            $ptr
    )
)



                    ;;; Test

!(AddRule Home (c1 c2) action goal True) ; Add rule to the atom space

!(is_rule) ; it should return the rule

!(add_category pointer category)







; !(add-atom &openpsi (A a))
; !(match &openpsi (A a) (A a)) 
; !(match &openpsi (: Home (ImplicationLink (AndLink (c1 c2) action) goal) ) (: Home (ImplicationLink (AndLink (c1 c2) action) goal) ) )
; !(size-atom  (collapse ( match &openpsi (: Home (ImplicationLink (AndLink (c1 c2) action) goal) ))))
