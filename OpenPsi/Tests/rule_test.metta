!(register-module! ../../../Metta-Language-Practice) ;to load path for current page

!(import! &self Metta-Language-Practice:OpenPsi:OpenpsiRule) ;to load last file (OpenpsiRule) for current page

; !(AddRule handle (c1 c2) action goal True) ; Add rule to the atom space
(: z Goal)
(: y Action)

!(AddRule x (x1 x2) y z (TTV 1 (STV 11.0 11.0)))


;            Structure for the AssertEqual Function
;                  (assertEqual <Actual> <Expected>)


!(add-atom &openpsi (: rule1 (ImplicationLink (AndLink (c1 c2) action) goal)))
!(assertEqual (getContext rule1) %Undefined%)
!(assertEqual (getGoal rule1) %Undefined%)
!(assertEqual (getAction rule1) %Undefined%)


!(assertEqual (Exist_fun &openpsi rule1) True)

!(addGoal last 1.0 0.5) ;To Add the New Goal
!(assertEqual (addGoal last 1.0 0) (Goal With Id last is Already Existed))  ;Already Existed
!(assertEqual (addGoal last 1.0 10)(Invalid goal or DesiredGoalValue (dgv) Value)) ;Invalid dgv
!(assertEqual (addGoal last 10 1.0)(Invalid goal or DesiredGoalValue (dgv) Value)) ;Invalid Value


!(setGoalValue last 0.9)
!(setGoal_DV last 0.4)

; !(setGoalValue run 0.5)  ;Test to change the goal Value
; !(setGoal_DV run 0.1)   ;
