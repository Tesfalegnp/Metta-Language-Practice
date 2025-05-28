!(bind! &openpsi (new-space));Create Atom Space
;
( = (OpenPsiRules) &openpsi)
!(add-atom (OpenPsiRules) (PredicateNode action executed) )


; This function creates a rule by adding an AndLink for context and action
; (: AndLink(-> String String Bool)) 
; (=(AndLink $x $y)
;     (if(and $x $y)
;           True
;           False
;   )
; )

; (: ImplicationLink(-> Bool String String)) ; Implicationlink type
;(=(ImplicationLink $x $y)
;  (
;    if(== $x True)
;         $y   ;Goal
;        "Does Not Meet The Goal " ;Out of goal
;  )
;)
;
;;; Example usage for add_rule
; (: add_rule(->String String String Bool Bool))
;(: x 1)
;(: x 2)
;!(collapse (get-type x))
;!(collapse (get-type x))
;(: rule1 (ImplicationLink (AndLink (x y) (z w)) "Goal Meet"))
;(: rule1 (STV 1.0 1.0))
;
;!(collapse (get-type rule1))

(= (addLink $linkType $source)
   (let () (add-atom &self ($linkType $source )) ($linkType $source))
   )
(= (addLink $linkType $source $target)
   (let () (add-atom &self ($linkType ($source $target))) ($linkType ($source $target)))
   )

; addLink, addRule
; (ImplicationLink tv
  ; (AND_LINK (c a)) 
  ; goal
  ; )
  ; (1.0 1.0) True False
!(addLink ImplicationLink AndLink Goal)
!(addLink AndLink (c1 c2) action)

; (= (addTwo $one $two) (+ $one $two))
; (= (addTwo $one $two $three) (+ (+ $one $two) $three))
; !(addTwo 1 2 3)
( = (add-rule $context $action $goal $TV)
   ( let* 
       (     
           ; Create AndLink with context and action And ImplicationLink 
           ; (add-atom &self (: $handle (ImplicationLink $andLink $goal)))))
           ;($hca (add-atom &openpsi (AndLink ($context $action))))
           ($hca (addLink AndLink ($context $action)))
           ($rule (addLink ImplicationLink $hca $goal))

       )
       $rule
     
       ;(: add-atom (-> Grouneded Atom (->)))
       ; Set truth value for the rule


      ;  (
       ;   if ( == $rule $goal)
       ;   (add-atom &openpsi $rule)
       ;   (empty)
      ;  )
     

;
;; !(add-rule True True "Goal meet" T); Like to Test May Test Not correct, I am Not Sure it!
;!(add-rule (c1 c2) True "head" True)
;
;
;;!(match &openpsi (AndLink $x $y)  $y)
;;!(match &openpsi (ImplicationLink $x $y) $y)
;;
;;
;;!(match &openpsi $x $y)
;
;
;
;
;
;            ;General Structure
;; [impelementationLink (AndLink (context Action)) goal]
