#lang racket

(require sicp)
(require "Exercise2.10.rkt")
(provide (all-from-out "Exercise2.10.rkt"))
(provide mul-interval)

(define (>= a b)
  (or (> a b) (= a b)))

; assume lower_bound <= upper_bound
(define (signs-NO interval)
  (let ((lower_bound (lower-bound interval))
        (upper_bound (upper-bound interval)))
    (cond ((>= lower_bound 0) 0)
          ((and (< lower_bound 0) (>= upper_bound 0) 1))
          ((< upper_bound 0) 2))))

(define (mul-interval x y)
  (let ((x-sign (signs-NO x))
        (y-sign (signs-NO y))
        (x-lower-bound (lower-bound x))
        (x-upper-bound (upper-bound x))
        (y-lower-bound (lower-bound y))
        (y-upper-bound (upper-bound y)))
    (cond ((and (= x-sign 0) (= y-sign 0)) ; x and y are both [+, +]
           (make-interval (* x-lower-bound y-lower-bound) (* x-upper-bound y-upper-bound)))
          ((and (= x-sign 0) (= y-sign 1)) ; x is [+, +], y is [-, +]
           (make-interval (* x-upper-bound y-lower-bound) (* x-upper-bound y-upper-bound)))
          ((and (= x-sign 0) (= y-sign 2)) ; x is [+, +], y is [-, -]
           (make-interval (* x-upper-bound y-lower-bound) (* x-lower-bound y-upper-bound)))
          ((and (= x-sign 1) (= y-sign 0)) ; x is [-, +], y is [+, +]
           (make-interval (* x-lower-bound y-upper-bound) (* x-upper-bound y-upper-bound))) ; or just use (mul-interval y x)
          ((and (= x-sign 1) (= y-sign 1)) ; x is [-, +], y is [-, +]
           (let ((p1 (* x-lower-bound y-lower-bound))
                 (p2 (* x-lower-bound y-upper-bound))
                 (p3 (* x-upper-bound y-lower-bound))
                 (p4 (* x-upper-bound y-upper-bound)))
             (make-interval (min p2 p3) (max p1 p4))))
          ((and (= x-sign 1) (= y-sign 2)) ; x is [-, +], y is [-, -]
           (make-interval (* x-upper-bound y-lower-bound) (* x-lower-bound y-lower-bound)))
          ((and (= x-sign 2) (= y-sign 0)) ; x is [-, -], y is [+, +]
           (make-interval (* x-lower-bound y-upper-bound) (* x-upper-bound y-lower-bound))) ; or just use (mul-interval y x)
          ((and (= x-sign 2) (= y-sign 1)) ; x is [-, -], y is [-, +]
           (make-interval (* x-lower-bound y-upper-bound) (* x-lower-bound y-lower-bound)))
          ((and (= x-sign 2) (= y-sign 2)) ; x is [-, -], y is [-, -]
           (make-interval (* x-upper-bound y-upper-bound) (* x-lower-bound y-lower-bound))))))

(module+ main
  (define p1 (make-interval 1 2))
  (define p2 (make-interval -1 2))
  (define p3 (make-interval -2 -1))
  (display "p1: ")
  (print-interval p1) (newline)
  (display "p2: ")
  (print-interval p2) (newline)
  (display "p3: ")
  (print-interval p3) (newline)
  (display "mul p1 p1: ")
  (print-interval (mul-interval p1 p1)) (newline)
  (display "mul p1 p2: ")
  (print-interval (mul-interval p1 p2)) (newline)
  (display "mul p1 p3: ")
  (print-interval (mul-interval p1 p3)) (newline)
  (display "mul p2 p1: ")
  (print-interval (mul-interval p2 p1)) (newline)
  (display "mul p2 p2: ")
  (print-interval (mul-interval p2 p2)) (newline)
  (display "mul p2 p3: ")
  (print-interval (mul-interval p2 p3)) (newline)
  (display "mul p3 p1: ")
  (print-interval (mul-interval p3 p1)) (newline)
  (display "mul p3 p2: ")
  (print-interval (mul-interval p3 p2)) (newline)
  (display "mul p3 p3: ")
  (print-interval (mul-interval p3 p3)) (newline)
  )