#lang scheme
; Define a procedure square-tree analogous to the square-list procedure of
; exercise 2.21. That is, square-list should behave as follows:
; (square-tree
; (list 1
; (list 2 (list 3 4) 5)
; (list 6 7)))
; (1 (4 (9 16) 25) (36 49))
; Define square-tree both directly (i.e., without using any higher-order procedures) and also by using
; map and recursion.

(define (square-tree t)
  (cond
    ((null? t) '())
    ((pair? t) (cons (square-tree (car t))
                     (square-tree (cdr t))))
    (true (* t t))))

(define (square-tree-hof t)
  (if (list? t)
      (map square-tree-hof t)
      (* t t)))

(define t
  (list 1 
        (list 2 (list 3 4) 5)
        (list 6 7)))

(display (square-tree t))
(newline)
(display (square-tree-hof t))