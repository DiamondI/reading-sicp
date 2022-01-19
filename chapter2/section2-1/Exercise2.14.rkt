#lang racket

(require sicp)
(require "Exercise2.12.rkt")

(define (par1 r1 r2)
  (div-interval 
   (mul-interval r1 r2)
   (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval 
     one
     (add-interval 
      (div-interval one r1) 
      (div-interval one r2)))))

(module+ main
  (define r1 (make-center-percent 10 5))
  (define r2 (make-center-percent 20 4))
  (display "r1/r1: ")
  (print-interval (div-interval r1 r1)) (newline)
  (display "r2/r2: ")
  (print-interval (div-interval r2 r2)) (newline)
  (display "r1/r2: ")
  (print-interval (div-interval r1 r2)) (newline)
  (display "r2/r1: ")
  (print-interval (div-interval r2 r1)) (newline)
  )