;map -- applies a function to all the contents of an expression
;        -- (map half (2 4 6 )) -> (1 2 3)


(= (half $x) (/ $x 2))
(= (multiply $b) (* $b 2.0)) 

(=(half_float $x) (/ $x 2))

(= (map $oper $expr)
    (collapse ($oper (superpose $expr)))
)
(= (map` $oper $expr $accum)
    ()
)

(=(by_3 $a) (* $a 3))


;Halp of Given 
!("Half")
!(map half (10))
!(map half (2 4 6)) 


;Double 
!("Double")
!(map multiply (10))
!(map multiply (2 4 6))  

;Multply By Three
!("Multiply By Three")
!(map by_3 (9))
!(map by_3 (1 3 6 9))


;Extra Check
!(Extra Code For Integer check)
!(map half(1 3 5)) ;Now it Apply only Integer number Why Float or Double ?

;For Float Give Number Must be Float 
!(map half_float (5.0))
!(map half_float(1.0 3.0 5.0))


!(map half ()) ;
