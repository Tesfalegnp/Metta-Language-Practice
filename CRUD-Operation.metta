        ;              ;; Simple Define the Knowledge Base
        ;  (Parent Bob Alian)
        ;  (Parent Manica Hermela)
        ;  (Parent Bob Jeny)
        ;              ;;Pattern Matching
        ;  !(match &self(Parent Bob $x) $x) ; Expectes (Jeny, Alian)

!("Create New Space") ; Create a new space for the CRUD operation
; Create 

!(bind! &created_entity (new-space))    ; Create a new space for the CRUD operation
!(match &created_entity $entity_1 $entity_1) ; Match the created entity with two variables

; Add new entities to the space
; Add Atom (it holdes two values first identifier os space and sencond is the atom)
!(add-atom &created_entity (Parent Bob Alian)) ; Add a new atom to the space
!(add-atom &created_entity (Parent Manica Hermela)) ; Add another atom to the space
!(add-atom &created_entity (Parent Bob Jeny)) ; Add another atom to the space

!(match &created_entity $entity $entity) ; Match the created entity with two variables
!(match &created_entity (Parent Bob $check) $check) ; execute the pattern matching for checking the added atom

!("Deleted an "'Parent Bob Alian'" from the space") ; Create a new space for the CRUD operation
;remove an entity from the space (Deletion operation)
!(remove-atom &created_entity (Parent Bob Alian)) ; Remove the specified atom from the space
!(match &created_entity $entity $entity) ; Match the created entity with two variables
!(match &created_entity (Parent Bob $check) $check) ; execute the pattern matching for checking the added atom


!("Update an "'Parent Bob Alian'" to "'Parent Bob Georgy'" in the space") ; Create a new space for the CRUD operation
; Update an entity in the space (Update operation)
; Metta does not support update operation directly, but we can remove the old entity and add a new one
!(remove-atom &created_entity (Parent Bob Alian)) ; Remove the specified atom from the space
!(add-atom &created_entity (Parent Bob Georgy)) ; Add the updated atom to the space
!(match &created_entity $entity $entity) ; Match the created entity with two variables
!(match &created_entity (Parent Bob $check) $check) ; execute the pattern matching for checking the added atom
 

 ; Other way of impelementation for Update

 (= (update-atom $space $olde_atom $new_atom)
        (
            let $x (remove-atom $space $olde_atom) (add-atom $space $new_atom)
        )
 )
 
!(update-atom &created_entity (Parent Bob Jeny) (Parent Bob Alex))
!(match &created_entity(Parent Bob $check) $check) ;Expected Updatation is (Georgy, Alex)




;       Implemented by Tesfalegn at iCog-Labs(in Addis Ababa)