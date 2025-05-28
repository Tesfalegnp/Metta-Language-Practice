!(bind! &openpsi( new-space))
!(bind! &openpsi_catch (new-space))
!(bind! &openpsi_record (new-space))
!(bind! &openpsiRule OpenpsiRule)

( = (as) &openpsi)
( = (as_catch) &openpsi_catch)
( = (as_record) &openpsi_record)
( = (op_rule) &openpsiRule)

( = (TRUE_TV) True)
( = (FALSE_TV) False)

!(add-atom (as)(PREDICATE_NODE "action-executed"))

( = (check_satisfiability $rule $opr)
    (
       let* (
                ($query_body ( if  (== (match (as) ($rule))  (match (op_rule) ($opr)))
                                      ( let*(
                                                ( 
                                                    ($_ (remove-atom (as_catch) $rule))
                                                    ($_ (add-atom (as_record) $rule))
                                                )
                                                 ($rule)
                                            ))
                                       FALSE_TV
                             )
                )
            )
            (
                if(== $query_body (FALSE_TV))
                    (FALSE_TV)
                    (TRUE_TV)
            )
    )
)
( = (imply $rule $opr)
    (
          if(== (match (as_record) $rule) $rule)
            ("The openpsi rule should be checked for satisfiablity first.")
            (
                let* 
                (
                    ($condition (match (as_catch) $rule))
                    ($count (size-atom $condition))
                    ($result (if (== $count 0))
                                (TRUE_TV)
                                (FALSE_TV)
                        )
                )
                ($result)
            )

    )
)
( = (was_action_executed $rule)
    (
        let* 
        ($executed (match (as_record) $rule))
        (
            if($executed)
                (TRUE_TV)
                (FALSE_TV)
        )
    )
)