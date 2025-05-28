;returns the length of an expression
; it count's give elements from exprission
(=(length $expression)
   (
    if (== $expression ())
        0
        (+ 1 (length(cdr-atom $expression)))
   )
)

!(length(1 2 3 4 5 6 7 8 )); output 8
!(length("abebe","Ayele","Bob", "Manica")) ;output 4, But output 3 Why ?