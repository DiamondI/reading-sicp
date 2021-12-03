#lang racket
; exercise 1.17

(define (even? n)
  (= (remainder n 2) 0))

(define (double a) (+ a a))
(define (halve a) (/ a 2))
(define (* a b)
  (cond ((= b 0)
         0)
        ((even? b)
         (double (* a (halve b))))
        (else
         (+ a (* a (- b 1))))))

(* 4 5)
(* 19 91)