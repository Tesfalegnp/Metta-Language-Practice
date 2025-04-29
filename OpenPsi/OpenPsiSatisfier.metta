!(bind! &openpsi(new-space))

( = (as) &openpsi)

(: grounding(-> Expression Expression Bool)); Set Data Type for Grounding Function
( = (grounding $var_soln $term_soln)
    (
        let*
            (
                ($result (True))
                ($count (sizea-atom $var_soln))
                ($return ( if(< 0 $count)
                            ( 
                                let* (
                                        ($implicator ($var_soln))
                                     )
                                     (if (== (match (as) (superpose $var_soln)) VARIABLE_NODE )
                                        (False)
                                        (True)
                                    )
                            ) 
                            (
                                let* (
                                        ($implicator ($var_soln))
                                     )
                                     (True)
                            )
                         )
                )

            )
    )
)