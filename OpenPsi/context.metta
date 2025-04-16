;; Define contexts
(= (context-hungry
  (EvaluationLink
    (PredicateNode "is-hungry")
    (ListLink (ConceptNode "agent"))
  ))
)

(= (context-food-available
  (EvaluationLink
    (PredicateNode "food-available")
    (ListLink (ConceptNode "location-kitchen"))
  ))
)