#lang racket

(require sicp)
(provide (all-defined-out))

(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (filter predicate sequence) 
  (cond ((null? sequence) nil) 
		((predicate (car sequence)) 
		 (cons (car sequence) 
			   (filter predicate (cdr sequence)))) 
		(else (filter predicate (cdr sequence)))))

 (define (prime? x) 
   (define (test divisor) 
     (cond ((> (* divisor divisor) x) true) 
           ((= 0 (remainder x divisor)) false) 
           (else (test (+ divisor 1))))) 
   (test 2)) 

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(module+ main
  (define list1 (list 1 2 3 4))
  (define list2 (list 2 4 6 8))
  (display (append list1 list2))
  )