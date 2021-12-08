#lang racket

(require sicp)
(require "procedures_in_section1-3_body.rkt")

(define (iterative-improvement good-enough? improve)
  (define (iter-guess guess)
    (if (good-enough? guess)
        guess
        (iter-guess (improve guess))))
  iter-guess)

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  ((iterative-improvement good-enough? improve) 1.0))

(define (fixed-point f guess)
  (define (good-enough? guess)
    (let ((tolerance 0.00001)
          (next-guess (f guess)))
      (< (abs (- guess next-guess)) tolerance)
      ))
  ((iterative-improvement good-enough? f) guess))

(module+ main
  (sqrt 10) ;3.162277665175675, python 10**0.5 is 3.1622776601683795
  (sqrt 9) ;3.00009155413138, textbook is 3.00009155413138
  (fixed-point cos 1.0) ;0.7390893414033927, textbook is .7390822985224023
  (fixed-point (lambda (y) (+ (sin y) (cos y)))
             1.0) ;1.2587228743052672, textbook is 1.2587315962971173
  ;fixed-point has a slightly different, because when reach the tolerance, textbook
  ;returns `next-guess`, while in procedure iterative-improvement, only returns `guess`
  )