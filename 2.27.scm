#lang scheme

(define (deep-reverse x)
  (define (atom? x) (not (pair? x)))
  (cond
    ((null? x) '())
    ((atom? x) x)
    (else (map deep-reverse (reverse x)))))

(define x (list (list 1 2) (list 3 4)))

(print (deep-reverse x))