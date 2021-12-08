#lang racket

;defines procedures in section 1-3
;which may be used in exercises,
;for example square

(require sicp)
(provide (except-out (all-defined-out) sqrt))
(require "Exercise1.35.rkt")

(define (square x) (* x x))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define dx 0.00001)

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)
            ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g)
               guess))

(define (average a b)
  (/ (+ a b) 2))

(define (average-damp f)
  (lambda (x)
    (average x (f x))))

;sqrt using newtons-method
(define (sqrt x)
  (newtons-method
   (lambda (y)
     (- ((lambda (y) (* y y)) y) x))
   1.0))

(module+ main
  ;test deriv using cube
  ((deriv (lambda (x) (* x x x))) 5) ;75.00014999664018
  ;test average-damp using square
  ((average-damp (lambda (x) (* x x))) 10) ;55
  ;test newtons-method using sqrt
  (sqrt 10) ;3.162277660168388, result from python 10**0.5 is 3.1622776601683795
  )