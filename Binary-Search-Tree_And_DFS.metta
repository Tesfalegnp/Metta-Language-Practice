;;; ========= Binary Search Tree (BST) And DFS From Tesfalegn @Icog-Labs =========

;;; ----- Tree and Node Definitions -----
(: Tree Type)
(: Leaf Tree)
(: Node (-> Number Tree Tree Tree))

;;; ----- Insert into BST -----
(: insert (-> Number Tree Tree))
(= (insert $x Leaf) ;; if it have only one Elemenet
   (Node $x Leaf Leaf))

(= (insert $x (Node $v $l $r))
   (if (< $x $v)
       (Node $v (insert $x $l) $r)
       (Node $v $l (insert $x $r)))
)


;;; ----- Search in BST -----
(: search (-> Number Tree Bool))
(= (search $x Leaf) False) ;; if either not value have in the tree or NOT found until the tree recurse finish.
(= (search $x (Node $v $l $r))
   (if (== $x $v)
       True
       (if (< $x $v)
           (search $x $l)
           (search $x $r)))
)


;;; ----- Build Tree from List -----
(: build-tree (-> (List Number) Tree))
(= (build-tree ()) Leaf)
(= (build-tree (:: $h $t))
   (insert $h (build-tree $t)))


;;; ----- DFS: Compare Two Trees -----

(: dfs (-> Tree Tree Bool))
(= (dfs Leaf Leaf) True) ; there is not element in tree/graph
(= (dfs Leaf (Node $v $l $r)) False) ;only right value have
(= (dfs (Node $v $l $r) Leaf) False)  ;only left value

(= (dfs (Node $v1 $l1 $r1) (Node $v2 $l2 $r2))
   (if (== $v1 $v2)
       (if (dfs $l1 $l2)
           (dfs $r1 $r2)
           False)
       False)
)

(= (my-bst) ;List of number
    (
        build-tree (:: 50 (:: 30 (:: 70 (:: 20 (:: 40 (:: 60 (:: 80 (:: 35 (:: 45 (:: 65 (:: 75 (:: 85 ()))))))))))))
   )
)



;;; ========= Test Section =========

;; Build a large tree



; !(my-bst) ;; Normal Inserted correctly

; !(search 75 (my-bst)) ;; Expected [True]


!(assertEqual (my-bst) (Node 85 (Node 75 (Node 65 (Node 45 (Node 35 (Node 20 Leaf (Node 30 Leaf Leaf)) (Node 40 Leaf Leaf)) (Node 60 (Node 50 Leaf Leaf) Leaf)) (Node 70 Leaf Leaf)) (Node 80 Leaf Leaf)) Leaf))
                                                     ; The Above Tree in Visual World 
                                    ;                              85
                                    ;                             /
                                    ;                           75
                                    ;                          /
                                    ;                        65
                                    ;                       /
                                    ;                     45
                                    ;                    /
                                    ;                 35
                                    ;                /   \
                                    ;             20     40
                                    ;               \
                                    ;               30
                                    ;                    \
                                    ;                     60
                                    ;                    /
                                    ;                 50
                                    ;                       \
                                    ;                        70
                                    ;                            \
                                    ;                             80

!(assertEqual (search 75 (my-bst)) True)
!(assertEqual (search 20 (my-bst)) True)
!(assertEqual (search 100 (my-bst)) False)
!(assertEqual (search 10 (my-bst)) False)
!(assertEqual (search 40 (my-bst)) True)
!(assertEqual (search 65 (my-bst)) True)


; ;;  DFS equality test
!(assertEqual (dfs (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf))) True)
!(assertEqual (dfs (Node 1 (Node 2 Leaf Leaf) Leaf)  (Node 1 Leaf (Node 2 Leaf Leaf)))  False)
!(assertEqual (dfs (Node 1 (Node 2 Leaf Leaf) (Node 1 Leaf Leaf))  (Node 1 (Node 1 Leaf Leaf) (Node 2 Leaf Leaf))) False)
