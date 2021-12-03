#lang sicp
; exercise 1.23

(#%require "Exercise1.22.rkt")

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (define (next test-divisor)
  (if (= test-divisor 2)
      3
      (+ test-divisor 2)))
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))
(define (prime? n)
  (= (smallest-divisor n) n))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) 
                       start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

; 12 primes from exercise 1.22
; 1009 *** 2
; 1013 *** 2
; 1019 *** 2
; 10007 *** 4
; 10009 *** 5
; 10037 *** 4
; 100003 *** 12
; 100019 *** 13
; 100043 *** 13
; 1000003 *** 40
; 1000033 *** 39
; 1000037 *** 36

(timed-prime-test-old 1009)
(timed-prime-test-old 1013)
(timed-prime-test-old 1019)
(timed-prime-test-old 10007)
(timed-prime-test-old 10009)
(timed-prime-test-old 10037)
(timed-prime-test-old 100003)
(timed-prime-test-old 100019)
(timed-prime-test-old 100043)
(timed-prime-test-old 1000003)
(timed-prime-test-old 1000033)
(timed-prime-test-old 1000037)
(timed-prime-test-old 10000000061) 
(timed-prime-test-old 100000000003) 
(timed-prime-test-old 100000000019) 
(timed-prime-test-old 100000000057) 
(timed-prime-test-old 1000000000039) 
(timed-prime-test-old 1000000000061) 
(timed-prime-test-old 1000000000063)

(newline)
(display "分割线")

(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)
(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)
(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)
(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)
(timed-prime-test 10000000061) 
(timed-prime-test 100000000003) 
(timed-prime-test 100000000019) 
(timed-prime-test 100000000057) 
(timed-prime-test 1000000000039) 
(timed-prime-test 1000000000061) 
(timed-prime-test 1000000000063) 