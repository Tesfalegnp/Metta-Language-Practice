(= (order $exp ()) "There is not wanted Value to Search") ;If the search value not given 
(= (order () $key) False) ; If search not found
(= (order) "You Should Give List and Wanted Value to Search") ;If both are not given  
(=(order $exp $key) 
    (  
        let*
         (   
            ($head (car-atom $exp))
            ($tail (cdr-atom $exp))
            ($result (if(== $key $head)
              True  ;if search Value Found it return
              (order $tail $key)
            ))
         ) 
         ($result)
    )
)
!(order( 7 3 9 1 8 5 3 4 6 2) 4)
!(order) ;you should give the list and the value to search

; implemented by Tesfalegn @iCog-Labs