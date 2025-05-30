
;  This is a metta file that defines a function to delete an element from a list.
(: delete (-> (List $rest) $rest (List $rest))) ; Type for delete
(= (delete () $delete_value) ()) ;without any List, we only want to delete something return empty
(= (delete (List $delete_vale) ()) (List $delete_vale)) ; if list have only one Element return eempty 
(= (delete (:: $first_atom $rest) $delete_vale)
     (if (== $first_atom $delete_vale)
         $rest  
         (
            :: $first_atom (delete $rest $delete_vale)
        )
    )
)
! (delete (:: 1 (:: 2 (::3 ()))) 2 ) ;For Delete and Expect 1 3
! (delete (:: "1" (:: "2" (::"3" ()))) "1" ) ;For Delete and Expect 2 3
! (delete (:: 1 (:: 2 (::3 ()))) 4 ) ;For Delete and Expect 1 2 3
! (delete (:: 1 ()) 1)  ;For Delete and Expect empty


 