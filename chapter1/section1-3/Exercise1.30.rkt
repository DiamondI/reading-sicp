#lang sicp

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
    (iter a 0))

;--------------------------------------------
; test iterative sum function using the same
; process as exercise 1.29

(define (odd? n)
  (= (remainder n 2) 1))

(define (simpson-rule f a b n)
  (define (h a b n)
     (/ (- b a) (* 1.0 n)))
  (define (simpson-term x)
    (cond ((or (= x 0) (= x n))
          (f (+ a (* x (h a b n)))))
          (else
           (if (odd? x)
               (* 4 (f (+ a (* x (h a b n)))))
               (* 2 (f (+ a (* x (h a b n)))))))))
  (define (simpson-next x)
    (+ x 1))
  (* (/ (h a b n) 3) (sum simpson-term 0 simpson-next n)))

(define (cube n)
  (* n n n))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) 
     dx))

(integral cube 0 1 0.01)
(integral cube 0 1 0.001)
(simpson-rule cube 0 1 100)
(simpson-rule cube 0 1 1000)
