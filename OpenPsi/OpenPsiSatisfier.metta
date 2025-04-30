!(bind! &openpsi(new-space))
!(bind &openpsi_catch (new-space))

( = (as) &openpsi)
( = (as_catch) &openpsi_catch)

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
                                        ($_ (add-atom (as_catch) $var_soln))
                                     )
                                     (if (== (match (as) (superpose $var_soln)) VARIABLE_NODE )
                                        (False)
                                        (True)
                                    )
                            ) 
                            (
                                let* (
                                        ($_ (add-atom (as_catch) $var_soln))
                                     )
                                     (True)
                            ))))))                            