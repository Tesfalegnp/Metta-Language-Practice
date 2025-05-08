
!(bind! &openpsi (new-space));Create Atom Space
!(bind! &category (new-space))

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
                ($check (== (size-atom $pre_rule) 0)) ; Generate TruthValue for the variable check
                
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

(= Exist_fun(-> hyperon::space::DynSpace Atom Bool)) ;if anything not found, generete false, otherway True
(= (Exist_fun $space $atom) 
    (
        let $result (collapse (get-type-space $space $atom)) (not (== (%Undefined%) $result)) ;Retriveing Type information
    )
)

(: ruleType(-> Grounded Atom))
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

; ( = (is_rule)
;     (
;         let* (
;                ($rule (match &openpsi (: Home (ImplicationLink (AndLink (c1 c2) action) goal) ) (: Home (ImplicationLink (AndLink (c1 c2) action) goal) ) ))
;             ;  ($rule (match &openpsi (: $ptr (ImplicationLink (AndLink ($c1 $c2) $action) $goal) ) (: $ptr (ImplicationLink (AndLink ($c1 $c2) $action) $goal) ) ))
;             )
;             $rule
;     )
; )


( = (add_category $new_category)
        (
           if ((Exist_fun &category $new_category))
                   ($new_category) ;if Category is Founded
                   (let* (
                            ($_ (add-atom &category (: $new_category Category)))
                         ) $new_category 
                   )))

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

(: get_category(->Atom)) 
( = (get_category)
    (
        collapse(match &category (: $category Category) $category)
    )
)

(: getContext(->Expression Symbol))
( = (getContext $rule)
    (
         case (ruleType $rule)
         (
            (((ImplicationLink (AndLink ($context $action)) $goal)) $context)
            (((ImplicationLink (AndLink ($context $action)) $goal) (TTV $timestamp $stv)) $context)
            (((TTV $timestamp $stv) (ImplicationLink (AndLink ($context $action)) $goal)) $context)
            ($_ %Undefined%)
         )
    )
)

(: getAction (->Expression Symbol))
( = (getAction $rule)
    (
        case (ruleType $rule)
         (
            (((ImplicationLink (AndLink ($context $action)) $goal)) $action)
            (((ImplicationLink (AndLink ($context $action)) $goal) (TTV $timestamp $stv)) $action)
            (((TTV $timestamp $stv) (ImplicationLink (AndLink ($context $action)) $goal)) $action)
            ($_ %Undefined%)
         )
    )
)

(: getGoal(->Expression Symbol))
( = (getGoal $rule)
    (
        case (ruleType $rule)
         (
            (((ImplicationLink $AndLink $goal)) $goal)
            (((ImplicationLink $AndLink $goal) (TTV $timestamp $stv)) $goal)
            (((TTV $timestamp $stv) (ImplicationLink $AndLink $goal)) $goal)
            ($_ %Undefined%)
         )
    )
)

(: IsValid(->Number Bool))
(= (IsValid $value)
    (and (>= $value 0.0) (<= $value 1.0))
)
 
 (= (addGoalHelper $name $Value $dgv)
    (
        if (and (IsValid $Value) (IsValid $dgv))
        ( if(not (Exist_fun &self $name))
            ( let* (
                     ($_ (add-atom &self (: $name (Goal $Value $dgv))))
                     )
                     $name
            ) (Goal With Id $name is Already Existed)
        ) (Invalid goal or DesiredGoalValue(dgv) Value)
    )
 )

(: addGoal(->Symbol Number Atom Atom))
(= (addGoal $name $value $dgv)
    (if(== $dgv ())
        (addGoalHelper $name $value 1.0)
        (addGoalHelper $name $value $dgv)
    )
) 

;To Update Goal Value without Return anyvalue
 (: setGoalValue(->Symbol Number (->))); no return type
(= (setGoalValue $goal $value)
    ( if((Exist_fun &self $goal))
            (let (Goal $oldV $old_desired_value) (get-type $goal) 
                (update-atom &self (: $goal (Goal $oldV $old_desired_value)) (: $goal (Goal $value $old_desired_value) ))
            )
            (Invalid Goal Id)
    )
)

;To Update Desired Goal Value without Return anyvalue
 (: setGoal_DV(->Symbol Number (->))); no return type
(= (setGoal_DV $goal $value)
    ( if((Exist_fun &self $goal))
            (let (Goal $oldV $old_desired_value) (get-type $goal) 
                (update-atom &self (: $goal (Goal $oldV $old_desired_value)) (: $goal (Goal $oldV $$value) ))
            )
            (Invalid Goal Id)
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
