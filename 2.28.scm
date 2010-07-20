#lang scheme

(define (fringe x . xs)
  (cond
    ((null? x) '())
    ((and (null? xs) (pair? x)) (apply fringe x))
    ((null? xs) (list x))
    (else (append (fringe x) (fringe xs)))))
     
(define x (list (list 1 2) (list 3 4)))

(print (fringe x))
(print (fringe (list x x)))
