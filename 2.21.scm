#lang scheme
; (define (square-list items)
; (if (null? items)
; nil
; (cons <??> <??>)))
; (define (square-list items)
; (map <??> <??>))
; 

(define (square-list items)
  (if (null? items)
      '()
      (cons (* (car items) (car items)) (square-list (cdr items)))))

(define (square-list-map items)
  (map (lambda (x) (* x x)) items))

(define xs '(1 2 3 4 5))

(display (square-list xs))
(newline)
(display (square-list-map xs))