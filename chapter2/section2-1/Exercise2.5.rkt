#lang racket

(require sicp)

(define (square a)
  (* a a))

(define (fast-expt b n)
  (cond ((= n 0) 
         1)
        ((even? n) 
         (square (fast-expt b (/ n 2))))
        (else 
         (* b (fast-expt b (- n 1))))))

(define (!= a b)
  (not (= a b)))

(define (cons a b)
  (* (fast-expt 2 a) (fast-expt 3 b)))

(define (car z)
  (define (helper z res)
    (if (!= (remainder z 2) 0)
        res
        (helper (/ z 2) (+ res 1))))
  (helper z 0))

(define (cdr z)
  (define (helper z res)
    (if (!= (remainder z 3) 0)
        res
        (helper (/ z 3) (+ res 1))))
  (helper z 0))

(module+ main
  (define z (cons 123 456))
  (display (car z)) (newline)
  (display (cdr z)) (newline)
  )