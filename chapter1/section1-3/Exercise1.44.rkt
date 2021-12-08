#lang racket

;Exercise1.44

(require sicp)
(require "Exercise1.43.rkt")
(require "procedures_in_section1-3_body.rkt")

(define (smooth f)
  (lambda (x)
    (/ (+ (f x)
          (f (+ x dx))
          (f (- x dx))) 3)))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))

(module+ main
  ((n-fold-smooth square 10) 10) ;100.00000000080003
  ((n-fold-smooth sqrt 10) 10) ;3.162277660165215
  )