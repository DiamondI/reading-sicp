#lang sicp

;Exercise1.31

;product recursive
(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a) (product-recursive term (next a) next b))))

;product iterative
(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

;factorial's term is identity
(define (identity n) n)

;factorial recursive
(define (factorial-recursive n)
  (product-recursive identity 1 inc n)) ;inc is provided in #lang sicp, can be downloaded using DrRacket

;factorial iterative
(define (factorial-iterative n)
  (product-iterative identity 1 inc n))

;test factorial
(factorial-recursive 5)  ;120
(factorial-recursive 10) ;362800
(factorial-iterative 5)  ;120
(factorial-iterative 10) ;362800

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
(pi-approximation-recursive 1000000) ;3.1415942243828017
(pi-approximation-iterative 1000000) ;3.141594224382854