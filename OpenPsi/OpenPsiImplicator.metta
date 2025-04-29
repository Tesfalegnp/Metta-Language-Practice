!(bind! &openpsi( new-space))
!(bind! &openpsi_catch (new-space))
!(bind! &openpsi_record)

( = (as) &openpsi)
( = (as_catch) &openpsi_catch)
( = (as_record) &openpsi_record)

( = (TRUE_TV) True)
( = (FALSE_TV) False)

!(add-atom (as)(PREDICATE_NODE "action-executed"))

( = (check_satisfiability $rule $opr)
    (
       let* (
                ($query_body (if (== (match (as) ($rule))  (match (as) ($opr)))
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
            
    )
)