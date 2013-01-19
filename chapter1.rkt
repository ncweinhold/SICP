#lang racket

;; Exercise 1.2

(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))

;; Exercise 1.3

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x)
     (square y)))

(define (max x y)
  (if (> x y)
      x
      y))

(define (sum-of-squares-two-larger x y z)
  (if (> x y)
      (sum-of-squares x (max y z))
      (sum-of-squares y (max x z))))

;; Exercise 1.4

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; If b is a non-zero positive number the if block returns the + operator.
;; Else the if block returns the - operator.
;; This operator is then applied to the arguments a and b, thus returning
;; the sum of a and the absolute value of b.

;; Exercise 1.5

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;; (test 0 (p))

;; In applicative-order evaluation, the above expression never terminates
;; as the interpreter would evaluate all arguments fully before passing them
;; to the test procedure - so it would evaluate (p) which just evaluates to (p).
;;
;; In normal-order evaluation, the above expression evaluates to 0. This is 
;; because the value of (p) is not needed in the if block, so is never 
;; evaluated.

;; Exercise 1.11

(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (* 2 (f-recursive (- n 2)))
         (* 3 (f-recursive (- n 3))))))

(define (f-iterative n)
  (define (f-iter a b c count)
    (if (= count 0)
        c
        (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
  (f-iter 2 1 0 n))