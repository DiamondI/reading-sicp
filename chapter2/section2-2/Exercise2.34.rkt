#lang racket

(require sicp)
(require "procedures_in_section2-2_body.rkt")

(define (horner-eval x coefficient-sequence) 
  (accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* x higher-terms))) 
			  0 
			  coefficient-sequence))

(module+ main
  (display (horner-eval 2 (list 1 3 0 5 0 1)))
  )