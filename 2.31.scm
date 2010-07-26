#lang scheme
; Abstract your answer to exercise 2.30 to produce a procedure tree-map with the property
; that square-tree could be defined as
; (define (square-tree tree) (tree-map square tree))

(define (tree-map f t)
  (if (list? t)
      (map (lambda (x) (tree-map f x)) t)
      (f t)))

(define (square x) (* x x))

(define (square-tree tree) (tree-map square tree))

(define t
  (list 1 
        (list 2 (list 3 4) 5)
        (list 6 7)))

(display (square-tree t))
