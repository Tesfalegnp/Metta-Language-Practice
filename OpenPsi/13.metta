!(register-module! ../../../../12)
!(register-module! ../../../utilities-module)

!(import! &self hyperon-openpsi:main:rules:rule)
!(import! &self hyperon-openpsi:main:types)
!(import! &self utilities-module:utils)

;if rule is added with the addRule function then the &psiRules index knows 
;about it

(: z Goal)
(: y Action)

!(addRule x (x1 x2) y z (TTV 1 (STV 11.0 11.0)))
!(assertEqual (getContext x) (x1 x2))
!(assertEqual (getAction x) y)
!(assertEqual (getGoal x) z)
!(assertEqual (getTV x) (TTV 1 (STV 11.0 11.0)))

!(addRule x (x1 x2) y z (TTV 1 (STV 11.0 11.0)))

;if rule is not added with the addRule function then the &psiRules index does not 
;know about it
!(add-atom &self (: rule1 (IMPLICATION_LINK (AND_LINK (c1 c2) action) goal)))
!(assertEqual (getContext rule1) %Undefined%)
!(assertEqual (getGoal rule1) %Undefined%)
!(assertEqual (getAction rule1) %Undefined%)

!(assertEqual (existsIn &psiRules rule1) False)

!(assertEqual (existsIn &psiRules x) True)
