#lang sicp

;Exercise1.36

;fixed-point print approximation sequence
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;find fixed point for x -> log(1000) / log(x)
(define (f x)
  (/ (log 1000) (log x)))

;without average damping
(fixed-point f 2) ;34 steps

;with average damping
(fixed-point (lambda (x) (* (/ 1.0 2) (+ x (/ (log 1000) (log x))))) 2) ;9 steps