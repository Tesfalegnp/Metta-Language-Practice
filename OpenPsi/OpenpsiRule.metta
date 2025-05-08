
!(bind! &openpsi (new-space));Create Atom Space

(= (openpsi) &openpsi)

(= (FALSE_TV)(False (STV 0.0 1.0))); Stringth Truth Value (STV <Stringth> <Confidence>)
(= (TRUE_TV) (True (STV 1.0 1.0)))

(: Link_Fun(-> Expression Symbol Expression)) 
( = (Link_Fun $context $action)  ; AndLink type
    (
        let*(
            ($return_AndLink (AndLink $context $action))
            ($_ (add-atom &openpsi $return_AndLink))
            )
            $return_AndLink            
    )   
)

(: Link_Fun(-> Symbol Epression Expression Expression)) ; Implicationlink type
(=(Link_Fun $handle $context $action $goal)
    (
        let*
            (   
                ($source (Link_Fun $context $action))
                ($return_ILink (: $linkType (ImplicationLink $source $goal)))
                ($pre_rule (collapse (match &openpsi (: $linkType (ImplicationLink $source $goal)) (: $linkType (ImplicationLink $source $goal)) ) )) ;Retriving the Match Pattern from pre Atom Space
                ($check (== (size-atom $pre_rule) 0))
                
            )
            (  if(== $check True)
                    (
                       let*(
                            ($new_Rule (: $linkType (ImplicationLink $source $goal)))  
                            ($_ (add-atom &openpsi $new_Rule))
                           )
                           ($source $new_Rule)

                    )
                    ($source (car-atom $pre_rule))
            )
    )
)

(= (update-atom $space $old $new)
    (
      let $x (remove-atom $space $old) (add-atom $space $new)
    )
)

(= Exist_fun(->hyperon::space::DynSpace Atom Bool)) ;if anything not found, generete false, otherway True
(= (Exist_fun $space $atom) 
    (
        let $result (collapse (get-type-space $space $atom)) (not (== (%Undefined%) $result)) ;Retriveing Type information
    )
)

(: ruleType  (-> Grounded Atom))
( = (ruleType $atom)
    (collapse (get-type-space &openpsi $atom))
)

(: AddRule(-> Symbol Expression Symbol Symbol Bool Expression))
(= (AddRule $handle $context $action $goal $TV)
    (  
          let*  (
                    (($AndLink $rule) (Link_Fun $handle $context $action $goal))
                    ($exist (Exist_fun (openpsi) $rule))
                )
                ( if(== $exist True)
                    (: $handle (ruleType $handle))
                    (
                        let* (
                                ($NewRule (: $handle (ImplicationLink $AndLink $goal)))
                                ($_ (add-atom (openpsi) (: $handle $TV)))
                                ($_ (add-atom &self (IsExecuted $handle)))
                                ($_ (update-atom (openpsi) $rule $NewRule))
                             )
                             (: $handle (ruleType $handle))
                    )
                    
                )
    )
)

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
                ($_ (add-atom &openpsi (MEMBER_LINK $rule $category))); i depend in C++ code But MemberLink should be InheritanceLink.
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
