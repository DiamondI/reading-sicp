#lang racket
; exercise 1.18

(define (even? n)
  (= (remainder n 2) 0))

(define (double a) (+ a a))
(define (halve a) (/ a 2))
(define (* a b product)
  (cond ((= b 0)
         product)
        ((even? b)
         (* (double a) (halve b) product))
        (else
         (* a (- b 1) (+ product a)))))

(* 4 5 0)
(* 19 91 0)