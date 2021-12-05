#lang sicp

;Exercise1.32

;accumulate recursive
(define (accumulate-recursive combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner
       (term a)
       (accumulate-recursive combiner null-value term (next a) next b))))

;accumulate iterative
(define (accumulate-iterative combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

;sum-recursive
(define (sum-recursive term a next b)
  (accumulate-recursive + 0 term a next b))

;sum-iterative
(define (sum-iterative term a next b)
  (accumulate-iterative + 0 term a next b))

;product-recursive
(define (product-recursive term a next b)
  (accumulate-recursive * 1 term a next b))

;product-iterative
(define (product-iterative term a next b)
  (accumulate-iterative * 1 term a next b))

;factorial's term is identity
(define (identity n) n)

;factorial recursive
(define (factorial-recursive n)
  (product-recursive identity 1 inc n)) ;inc is provided in #lang sicp, can be downloaded using DrRacket

;factorial iterative
(define (factorial-iterative n)
  (product-iterative identity 1 inc n))

;test factorial
(display "test factorial")
(newline)
(display "==============")
(newline)
(factorial-recursive 5)  ;120
(factorial-recursive 10) ;362800
(factorial-iterative 5)  ;120
(factorial-iterative 10) ;362800
(newline)

;π approximation
;π term
(define (pi-term n)
  (define (add-two n) (+ n 2))
  (define (pi-term-numerator n)
    (if (= (remainder n 2) 1)
        (- (add-two n) 1)
        (add-two n)))
  (define (pi-term-denominator n)
    (if (= (remainder n 2) 1)
        (add-two n)
        (- (add-two n) 1)))
  (* 1.0 (/ (pi-term-numerator n) (pi-term-denominator n))))

;π approximation recursive
(define (pi-approximation-recursive n)
  (* 4 (product-recursive pi-term 1 inc n)))

;π approximation iterative
(define (pi-approximation-iterative n)
  (* 4 (product-iterative pi-term 1 inc n)))

;test π approximation
(display "test π approximation")
(newline)
(display "==============")
(newline)
(pi-approximation-recursive 1000000) ;3.1415942243828017
(pi-approximation-iterative 1000000) ;3.141594224382854
(newline)

(define (odd? n)
  (= (remainder n 2) 1))

(define (simpson-rule-recursive f a b n)
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
  (* (/ (h a b n) 3) (sum-recursive simpson-term 0 simpson-next n)))

(define (simpson-rule-iterative f a b n)
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
  (* (/ (h a b n) 3) (sum-iterative simpson-term 0 simpson-next n)))

(define (cube n)
  (* n n n))

(define (integral-recursive f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum-recursive f (+ a (/ dx 2.0)) add-dx b) 
     dx))

(define (integral-iterative f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum-iterative f (+ a (/ dx 2.0)) add-dx b) 
     dx))

;test recursive and iterative accumulate sum
(display "test integral")
(newline)
(display "==============")
(newline)
(integral-recursive cube 0 1 0.001)    ;0.249999875000001
(integral-iterative cube 0 1 0.001)    ;0.24999987500000073
(newline)

(display "test simpson-rule")
(newline)
(display "==============")
(newline)
(simpson-rule-recursive cube 0 1 1000) ;0.2500000000000003
(simpson-rule-iterative cube 0 1 1000) ;0.25000000000000006
(newline)