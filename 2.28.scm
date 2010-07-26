#lang scheme

(define (fringe x . xs)
  (if (null? xs)
      (if (list? x)
          (apply fringe x)
          (list x))
      (append (fringe x) (fringe xs))))

(define x (list (list 1 2) (list 3 4)))

(print (fringe x))
(newline)
(print (fringe (list x x)))
