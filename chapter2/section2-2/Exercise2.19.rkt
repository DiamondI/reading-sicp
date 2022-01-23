#lang racket

(require sicp)

(define us-coins (list 50 25 10 5 1))
(define us-coins-out-of-order (list 1 5 10 25 50))

(define (count-change amount)
  (cc amount us-coins))

(define (no-more? coin-values)
  (null? coin-values))

(define (except-first-denomination coin-values)
  (cdr coin-values))

(define (first-denomination coin-values)
  (car coin-values))

(define (cc amount coin-values)
  (cond ((= amount 0) 
         1)
        ((or (< amount 0) 
             (no-more? coin-values)) 
         0)
        (else
         (+ (cc 
             amount
             (except-first-denomination 
              coin-values))
            (cc 
             (- amount
                (first-denomination 
                 coin-values))
             coin-values)))))


(module+ main
  (display (count-change 100)) (newline)
  (display (cc 100 us-coins-out-of-order))
  )