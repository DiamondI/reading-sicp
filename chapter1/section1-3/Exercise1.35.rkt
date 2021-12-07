#lang sicp

;Exercise1.35

;fixed-point from textbook
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;test cos
(fixed-point cos 1.0) ;0.7390822985224024

;compute x -> 1 + 1/x
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0) ;1.6180327868852458