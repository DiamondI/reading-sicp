#lang sicp

;Exercise1.33

(define (filtered-accumulate combiner null-value term a next b filter)
  (define (iter a result)
    (if (> a b)
        result
        (if (filter a)
            (iter (next a) (combiner result (term a)))
            (iter (next a) result))))
  (iter a null-value))


;sum square of prime
(define (sq n) (* n n))

(define (smallest-div n)
  (define (divides? a b)
    (= 0 (remainder b a)))
  (define (find-div n test)
    (cond ((> (sq test) n) n) ((divides? test n) test)
          (else (find-div n (+ test 1)))))
  (find-div n 2))

(define (prime? n) 
     (if (= n 1) false (= n (smallest-div n))))

(define (sum-of-prime-square a b)
  (filtered-accumulate + 0 sq a inc b prime?))

(sum-of-prime-square 1 5) ;2^2 + 3^2 + 5^2 = 4 + 9 + 25 = 38

;product of positive integers less than n that are relatively prime to n
(define (gcd m n)
  (cond ((< m n) (gcd n m))
        ((= n 0) m)
        (else (gcd n (remainder m n)))))
(define (relative-prime? m n)
  (= (gcd m n) 1))

(define (product-of-relative-prime n)
  (define (filter x)
    (relative-prime? x n))
  (filtered-accumulate * 1 identity 2 inc n filter))

(product-of-relative-prime 10) ;3 * 7 * 9 = 189
