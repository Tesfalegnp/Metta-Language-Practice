;; Function 
(= (h $x)
  (if (== $x 3)
      4
      (if (== $x 4)
          5
          ( if (== $x 7)
              8 
              'undefined'
              )) 
       )   
)

;; Test Cases
(displayln "Testing (h 3):")
!(h 3) ; Expected output: 4

(displayln "Testing (h 4):")
!(h 4) ; Expected output: 5

(displayln "Testing (h 5):")
!(h 7) ; Expected output: 8

(displayln "Testing (h 7):")
!(h 9) ; Expected output: 'undefined