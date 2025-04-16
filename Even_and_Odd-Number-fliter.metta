

(=(even_fun $x)
  ( 
  if(< $x 0)
        ()
        (
          if(== (%  $x 2) 0 )
            ($x (even_fun (- $x 1)))
            ( even_fun (- $x 1)) 
        )
    
  )
)
!("Even Number Between 0 and 10")
!(even_fun 10)


(=(odd_fun $x)
  ( 
  if(< $x 0)
        ()
        (
          if(== (%  $x 2) 1)
            ($x (odd_fun (- $x 1)))
            ( odd_fun (- $x 1)) 
        )
    
  )
)
!("Odd Number Between 0 and 10")
!(odd_fun 10)
