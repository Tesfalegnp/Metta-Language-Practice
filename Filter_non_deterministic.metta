(: isEven (-> Number Bool))
(= (isEven $x) (== (% $x 2) 0))

(: isOdd (-> Number Bool))
(= (isOdd $x) (== (% $x 2) 1))

(: filter-nd (-> (-> Number Bool) Expression Expression))
(= (filter-nd $predicate $expression)
  (collapse                     
      (let $x (superpose $expression) 
         (if ($predicate $x)    
             $x                 
             Empty)))) 

;Reverse the filtered
(= (reverse-nd $xs)
   (collapse
      (let $x (superpose $xs)
         $x)))      

(: filter-nd-ordered (-> (-> Number Bool) Expression Expression))
(= (filter-ordered $predicate $expression)
   (let $filtered-reversed (filter-nd $predicate $expression)
      (reverse-nd $filtered-reversed)))


;  Test Cases with order reversed
! (filter-nd isEven (1 2 3 4 5 6 7 8 9 10 ))
! (filter-nd isOdd (1 2 3 4 5 6 7 8 9 10))

;  Test Cases with correct ordering
! (filter-ordered isEven (1 2 3 4 5 6 7 8 9 10 ))
! (filter-ordered isOdd (1 2 3 4 5 6 7 8 9 10))