#lang scheme
; A binary mobile consists of two branches, a left branch and a right branch. Each branch is a
; rod of a certain length, from which hangs either a weight or another binary mobile. We can represent a
; binary mobile using compound data by constructing it from two branches (for example, using list):
(define (make-mobile left right)
  (list left right))

; A branch is constructed from a length (which must be a number) together with a structure, which
; may be either a number (representing a simple weight) or another mobile:
(define (make-branch length structure)
  (list length structure))

; a. Write the corresponding selectors left-branch and right-branch, which return the branches of a
; mobile, and branch-length and branch-structure, which return the components of a branch.

(define left-branch car)
(define right-branch cadr)
(define branch-length car)
(define branch-structure cadr)

; b. Using your selectors, define a procedure total-weight that returns the total weight of a mobile.
(define (total-weight mobile)
  (define (branch-weight branch)
    (let [(s (branch-structure branch))]
      (if (list? s) (total-weight s) s)))
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

; c. A mobile is said to be balanced if the torque applied by its top-left branch is equal to that applied by its
; top-right branch (that is, if the length of the left rod multiplied by the weight hanging from that rod is equal
; to the corresponding product for the right side) and if each of the submobiles hanging off its branches is
; balanced. Design a predicate that tests whether a binary mobile is balanced.

(define (balanced? mobile)
  (let [(l (left-branch mobile))
        (r (right-branch mobile))]
    (define (torque b)
      (let [(len (branch-length b))
            (s (branch-structure b))]
        (if (number? s) 
            (* len s)
            (* len (total-weight s)))))          
    (define (balanced-branch? b)
      (or (number? (branch-structure b))
          (balanced? (branch-structure b))))
    (and
     (= (torque l) (torque r))
     (balanced-branch? l)
     (balanced-branch? r))))

(define m (make-mobile 
           '(3 ((2 5) (5 2))) '(7 ((1 2) (2 1)))))

(define m1 (make-mobile (list 2 m) (list 3 m)))

(display (total-weight m))
(display (balanced? m))
(display (total-weight m1))
(display (balanced? m1))
