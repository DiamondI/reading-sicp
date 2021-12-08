#lang racket

;Exercise1.40
(require sicp)
(require "procedures_in_section1-3_body.rkt")

(define (cubic a b c)
  (lambda (x)
    (+ (* x x x) (* a x x) (* b x) c)))

(module+ main
  (newtons-method (cubic 1 1 1) 1)
  )