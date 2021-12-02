#lang sicp

;Exercise1.29
(define (sum term a next b)
  (if (> a b) 
      0 
      (+ (term a) 
         (sum term (next a) next b))))

(define (odd? n)
  (= (remainder n 2) 1))

(define (simpson-rule f a b n)
  (define (h a b n)
     (/ (- b a) n))
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