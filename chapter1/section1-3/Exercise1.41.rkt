#lang racket

;Exercise1.41

(require sicp)

(define (double f)
  (lambda (x)
    (f (f x))))

(module+ main
  (((double (double double)) inc ) 5) ;21
  ; equal to the following
  (((double double) ((double double) inc)) 5) ;21
  )