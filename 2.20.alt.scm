#lang scheme

; thanks to Jos Koot on the PLT mailing list, who showed me how to do this
; with a single cond statement and no auxiliary functions

(define (same-parity x . xs)
 (cond
  ((null? xs) (list x))
  ((equal? (even? x) (even? (car xs))) (cons x (apply same-parity xs)))
  (else (apply same-parity x (cdr xs)))))
