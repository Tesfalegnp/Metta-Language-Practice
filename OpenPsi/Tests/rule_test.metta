!(register-module! ../../../Metta-Language-Practice) ;to load path for current page

!(import! &self Metta-Language-Practice:OpenPsi:OpenpsiRule) ;to load last file (OpenpsiRule) for current page

; !(AddRule handle (c1 c2) action goal True) ; Add rule to the atom space
(: z Goal)
(: y Action)

!(AddRule x (x1 x2) y z (TTV 1 (STV 11.0 11.0)))

; !(assertEqual (getContext x) (x1 x2))

;(assertEqual <>)
!(add-atom &openpsi (: rule1 (ImplicationLink (AndLink (c1 c2) action) goal)))
!(assertEqual (getContext rule1) %Undefined%)
!(assertEqual (getGoal rule1) %Undefined%)
!(assertEqual (getAction rule1) %Undefined%)


!(addGoal run 1.0 ())
!(setGoalValue run 0.5)
; !(setGoal_DV run 0.1)
