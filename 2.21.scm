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
      nil
      (cons (* (car items) (car items)) (square-list (cdr items)))))

(define (square-list items)
  (map (lambda (x) (* x x)) items))
