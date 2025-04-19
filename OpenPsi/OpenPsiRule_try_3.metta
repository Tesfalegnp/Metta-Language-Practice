;; ======================================
;; 1. Define States (Working Memory)
;; ======================================
(= (energy-level) 0.7)  ; Range: 0.0 to 1.0
(= (energy_low) 0.3) 
(= (social-level) 0.5)

;; ======================================
;; 2. Define Conditions
;; ======================================
(= (energy-low $energy_low)
   (if (>= energy-level $energy_low)
       ((= (energy_low) 0.8))
       ("Current Energy Is Enough")))

(= (social-low $social_low)
   (if (>= (social-level) $social_low)
       True
       False))

;; ======================================
;; 3. Define Actions
;; ======================================
(= (eat-food)
   (do
      (let* 
         (
            ($energy-update (0.8))
            (= (energy-level) 0.9)
         )
         (  
            (println "Eating food...")
            ("Energy Level Updated to " $energy-update)
            (energy-level)
         )
         )))

(= (call-friend)
   (do
      (println "Calling a friend...")
      (= social-level 0.7)))

;; ======================================
;; 4. Define Rules
;; ======================================
(= (rule-energy)
   (if (>= (energy_low) 0.2)
       (eat-food)
       (println "Energy is Enough")))

(= (rule-social)
   (if (== (social-low 0.4) True)
       (call-friend)
       (println "Social OK")))

;; ======================================
;; 5. Run All Rules
;; ======================================
(= (run-openpsi)
   ((rule-energy)
    (rule-social)
    ("Final state:")
    (println "Energy:" (energy-level))
    (println "Social:" (social-level))))

;; ======================================
;; 6. Execute!
;; ======================================
!(run-openpsi)