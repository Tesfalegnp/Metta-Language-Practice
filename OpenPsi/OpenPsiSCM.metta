
( = (OpenPsiSCM)
    (
        let*
            (
                ($is_init (False))
                ()
            )
            ()
    )
)

(: add_category(->Symbol ))
( = (add_category $new_category)
    (
        
    )
)

          	python -m pip install hyperon==0.2.3


(: was_action_executed(->Expression Expression)) ;?
( = (was_action_executed $rule)
    (

    )
)

(: add_to_category(->Expression Symbol Expression)) ;?
( = (add_to_category $rule $category)
    (

    )
)


(:add_rule(->Expression Symbol Symbol Bool Symbol Expression))
( = (add_rule $context $action $goal $TTV $category)
    (

    )
)

(:getAction(->Expression Symbol))
( = (getAction $rule)
    (

    )
)

(:get_category(->Symbol))
( = (get_category)
    (

    )
)

(: getContext(->Expression Expression))
( = (getContext $rule)
    (

    )
)

(: getGoal(Expression Symbol))
( = (getGoal $rule)
    (

    )
)

(: imply(->Expression Expression)) ;?
( = (imply $rule)
    (

    )
)

(: is_rule(->Expression Bool))
( = (is_rule $rule)
    (

    )
)

(: is_satisfiable(->Expression Bool))
( = (is_satisfiable $rule)
    (

    )
)