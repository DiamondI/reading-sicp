#lang racket

;Exercise1.43

(require sicp)
(require "Exercise1.42.rkt")
(require "procedures_in_section1-3_body.rkt")
(provide repeated)

(define (repeated f n)
  (define (iter n res)
    (cond ((= n 1)
           res)
          ((even? n)
           (iter (/ n 2) (compose res res)))
          (else
           (iter (- n 1) (compose res f)))))
  (iter n f))

(module+ main
  ((repeated inc 16) 5)   ;21
  ((repeated square 2) 5) ;625
  )