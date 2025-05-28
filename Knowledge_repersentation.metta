;; Define parent-child relationships
(parent Bob Ann)
(parent Bob Joe)
(parent Ann Mary)
(parent Ann John)

;; Function to find children of a person
(=(find-children $y)
    (
        (match &self(parent $y $x) $x)
    ))
    
;; Query example:
!(find-children Bob)  ;; Expected output: Ann, Joe
!(find-children Ann)  ;; Expected output: Ann, Joe




