; Define a global list to simulate state.
!(set! *choices* '("Option 1" "Option 2" "Option 3"))

; Function to simulate random selection from the list.
(!random-choice
  (let*
    ((!length (length *choices*))
     (!index (floor (* (rand) $length))))
    (get *choices* $index)
  )
)

; Non-deterministic function that uses random-choice.
(!non-deterministic-result $result
  (= $result (random-choice))
)

; Example queries:
(!non-deterministic-result $output)
($output)