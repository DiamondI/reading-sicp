#lang sicp
(#%require "Exercise1.21.rkt")
(#%provide timed-prime-test-old)
(define (timed-prime-test-old n)
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

(define (search-for-primes start end)
  (define (iter n)
    (cond ((or (= n end) (< n end))
           (timed-prime-test-old n)
           (iter (+ n 2)))
          ))
  (iter
   (if (odd? start)
       start
       (+ start 1))))

;(search-for-primes 1000 1019)       ; 1e3 
;(search-for-primes 10000 10037)     ; 1e4 
;(search-for-primes 100000 100043)   ; 1e5 
;(search-for-primes 1000000 1000037) ; 1e6
