#lang racket

(require sicp)

(define (cons x y)
  (display "my cons") (newline)
  (lambda (m) (m x y)))

(define (car z)
  (display "my car") (newline)
  (z (lambda (p q) p)))

(define (cdr z)
  (display "my cdr") (newline)
  (z (lambda (p q) q)))

(module+ main
  (define z (cons 1 2))
  (display (car z)) (newline)
  (display (cdr z)) (newline)
  )