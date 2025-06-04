;;; Define DFS for binary tree equality (structure + values)

;; Tree definition (for clarity)
(: Tree Type)
(: Leaf Tree)
(: Node (-> Number Tree Tree Tree))

;; DFS type
(: dfs (-> Tree Tree Bool))

;; Both trees are empty
(= (dfs Leaf Leaf) True)

;; One is empty, one is not
(= (dfs Leaf (Node $v $l $r)) False)
(= (dfs (Node $v $l $r) Leaf) False)

;; Both are nodes
(= (dfs (Node $v1 $l1 $r1) (Node $v2 $l2 $r2))
   (if (== $v1 $v2)
       (if (dfs $l1 $l2)
           (dfs $r1 $r2)
           False)
       False)
)
!(assertEqual 
  (dfs 
    (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf)) 
    (Node 1 (Node 2 Leaf Leaf) (Node 3 Leaf Leaf))) 
  True)

!(assertEqual 
  (dfs 
    (Node 1 (Node 2 Leaf Leaf) Leaf) 
    (Node 1 Leaf (Node 2 Leaf Leaf))) 
  False)

!(assertEqual 
  (dfs 
    (Node 1 (Node 2 Leaf Leaf) (Node 1 Leaf Leaf)) 
    (Node 1 (Node 1 Leaf Leaf) (Node 2 Leaf Leaf))) 
  False)

