;; Define a binary search tree node
(Node value left right)

;; Function to insert a value into the BST
(= (insert-tree tree value)
   (match tree
     ;; If the tree is empty, create a new node
     (None -> (Node value None None))
     ;; If the tree is not empty, compare the value with the current node's value
     ((Node curr-val left right) ->
       (if (< value curr-val)
           ;; Insert into the left subtree
           (Node curr-val (insert-tree left value) right)
           ;; Insert into the right subtree
           (Node curr-val left (insert-tree right value))))))


;; Function to search for a value in the BST
(= (search-tree tree value)
   (match tree
     ;; If the tree is empty, the value is not found
     (None -> False)
     ;; If the tree is not empty, compare the value with the current node's value
     ((Node curr-val left right) ->
       (if (= value curr-val)
           True
           (if (< value curr-val)
               ;; Search in the left subtree
               (search-tree left value)
               ;; Search in the right subtree
               (search-tree right value))))))


;; Function for in-order traversal of the BST
(= (in-order &tree)
   (match tree
     ;; If the tree is empty, return an empty list
     (None -> [])
     ;; If the tree is not empty, traverse left, visit node, then traverse right
     ((Node value left right) ->
       (concat (in-order left) [value] (in-order right))))
)

;; Example Usage
;; Create an empty tree
(None)

;; Insert values into the tree
(= tree1 (insert-tree None 10))
(= tree2 (insert-tree tree1 5))
(= tree3 (insert-tree tree2 15))
(= tree4 (insert-tree tree3 3))
(= tree5 (insert-tree tree4 7))

;; Search for values in the tree
!(search-tree tree5 7)  ;; Returns True
(search-tree tree5 20) ;; Returns False

;; Perform in-order traversal
!(in-order tree5) ;; Returns [3, 5, 7, 10, 15]