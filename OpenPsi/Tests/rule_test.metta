!(register-module! ../../../Metta-Language-Practice) ;to load path for current page

!(import! &self Metta-Language-Practice:OpenPsi:OpenpsiRule) ;to load last file (OpenpsiRule) for current page

!(AddRule handle (c1 c2) action goal True) ; Add rule to the atom space
