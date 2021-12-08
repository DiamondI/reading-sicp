#lang racket

(require sicp)
(require "Exercise1.37.rkt")
(provide tan-cf)

;tan-cf using cont-frac
(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1)
                   x
                   (- (* x x))))
             (lambda (i) (- (* 2 i) 1))
             k))

(module+ main
  (tan-cf (/ pi 4) 10) ;1.0
  (tan-cf 3.0 10) ;-0.1425465438397583, result from python math.tan(3) is -0.1425465430742778
  )