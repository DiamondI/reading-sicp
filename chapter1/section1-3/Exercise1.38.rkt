#lang sicp

;Exercise1.38

(#%require "Exercise1.37.rkt" (only-in sicp [cont-frac-iterative cont-frac]))

;use Euler’s expansion to get approximation of e

(+ 2 (cont-frac-iterative (lambda (i) 1.0)
                          (lambda (i)
                            (if (= (remainder (- i 2) 3) 0)
                                (* (+ 1 (quotient i 3)) 2)
                                1))
                          10))
