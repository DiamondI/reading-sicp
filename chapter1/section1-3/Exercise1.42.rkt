#lang racket

;Exercise1.42

(require sicp)
(require "procedures_in_section1-3_body.rkt")

(provide compose)
(define (compose f g)
  (lambda (x)
    (f (g x))))

(module+ main
  ((compose square inc) 6) ;49
  )