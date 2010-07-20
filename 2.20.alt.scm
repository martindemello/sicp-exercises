#lang scheme
(define (same-parity x . xs)
 (cond
  ((null? xs) (list x))
  ((equal? (even? x) (even? (car xs))) (cons x (apply same-parity xs)))
  (else (apply same-parity x (cdr xs)))))