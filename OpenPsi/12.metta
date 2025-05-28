!(bind! &psiRules (new-space))

(= (FALSE_TV) (False (STV 0.0 1.0))) ;False, with Maximum confidence
(= (TRUE_TV) (True (STV 1.0 1.0))) ;True, with Maximum confidence

(= (PsiRules) &psiRules)

(: addAndLink (-> Atom Symbol Atom))
(= (addAndLink $context $action)
   (let* (
          ($andLink (AND_LINK ($context $action)))
          ($_ (add-atom &self $andLink))
          )
        $andLink
     )
)

(: addRuleLink (-> Symbol Expression Symbol Symbol Expression))
(= (addRuleLink $handle $context $action $goal)
   (let*
    (
      ($andLink (addAndLink $context $action))
      ($rule (collapse (match &self (: $handle (IMPLICATION_LINK $andLink $goal)) (: $handle (IMPLICATION_LINK $andLink $goal)))))
      ($condition (== (len $rule) 0))
    )
      (if $condition 
            (
              let* (
                    ($newRule (: $handle (IMPLICATION_LINK $andLink $goal)))
                    ($_ (add-atom &self $newRule))
                   )
                  ($andLink $rule)
            )
            ($andLink (car-atom $rule)) 
      )
     )
)

(: existsIn Grounded Atom Atom)

(= (existsIn $space $atom)
   ( let $res (collapse (get-type-space $space $atom)) (not (== (%Undefined%) $res)) )
)

(: addRule (-> Symbol Atom Symbol Symbol Atom Atom))
(= (addRule $ruleHandle $context $action $goal $tv)
    (let*  (
              (($andLink $rule) (addRuleLink $ruleHandle $context $action $goal))
              ($exists (existsIn (PsiRules) $rule))
            )
              (if $exists 
                  (: $ruleHandle (getRuleType $ruleHandle))
                  (
                    let* (
                          ($newRule (: $ruleHandle  (IMPLICATION_LINK $andLink $goal)))
                          ($_ (add-atom (PsiRules) (: $ruleHandle $tv)))
                          ($_ (add-atom &self (isExecuted $ruleHandle (FALSE_TV))))
                          (() (update-atom (PsiRules) $rule $newRule))
                        )
                        (: $ruleHandle (getRuleType $ruleHandle))
                  )
                )
    )
)
 
(: getAction (-> Atom Atom))
(= (getAction $rule) 
   (
    case (getRuleType $rule) 
      (
        (((TTV $timestamp $stv) (IMPLICATION_LINK (AND_LINK ($context $action)) $goal)) $action)
        (((IMPLICATION_LINK (AND_LINK ($context $action)) $goal) (TTV $timestamp $stv)) $action)
        (((IMPLICATION_LINK (AND_LINK ($context $action)) $goal)) $action )
        ($_ %Undefined%)
      )
   )
)

(: getGoal (-> Atom Atom))
(= (getGoal $rule)  
  ( 
   case (getRuleType $rule) 
    (
      (((TTV $timestamp $stv) (IMPLICATION_LINK $andLink $goal)) $goal)
      (((IMPLICATION_LINK $andLink $goal) (TTV $timestamp $stv)) $goal)
      (((IMPLICATION_LINK $andLink $goal)) $goal)
      ($_ %Undefined%)
    )
   )
)

(: getContext (-> Atom Atom))
(= (getContext $rule)
   (
    case (getRuleType $rule) 
      (
        (((TTV $timestamp $stv) (IMPLICATION_LINK (AND_LINK ($context $action)) $goal)) $context)
        (((IMPLICATION_LINK (AND_LINK ($context $action)) $goal) (TTV $timestamp $stv)) $context)
        (((IMPLICATION_LINK (AND_LINK ($context $action)) $goal)) $context )
        ($_ %Undefined%)
      )

    )
)


(: getRuleType (-> Atom Atom))
(= (getRuleType $id) (collapse (get-type-space &psiRules $id)))

(: getTV (-> Atom Atom))
(= (getTV $id) 
   (
    case (getRuleType $id)
    (
      (((TTV $timestamp $stv) $link) (TTV $timestamp $stv))
      (($link (TTV $timestamp $stv)) (TTV $timestamp $stv))
      ($_ (TTV 0 (STV 0.0 0.0))) ;default case
    )
  )
)

!(addRule x (x1 x2) y z (TTV 1 (STV 11.0 11.0)))