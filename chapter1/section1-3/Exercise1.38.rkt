#lang sicp

;Exercise1.38

(#%require "Exercise1.37.rkt")

;use Euler’s expansion to get approximation of e

(+ 2 (cont-frac (lambda (i) 1.0)
                          (lambda (i)
                            (if (= (remainder (- i 2) 3) 0)
                                (* (+ 1 (quotient i 3)) 2)
                                1))
                          10)) ;2.7182817182817183
