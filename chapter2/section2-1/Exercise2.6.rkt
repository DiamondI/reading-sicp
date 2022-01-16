#lang racket

(require sicp)

(define (square a)
  (* a a))

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; define one and two directly

(define one (lambda (f) (lambda (x) (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

; define `+` directly

(define (+ a b)
  (lambda (f) (lambda (x) ((b f) ((a f) x)))))

; test

(module+ main
  (display ((one square) 2)) (newline)
  (display ((two square) 2)) (newline)
  (display (((+ one two) square) 2)) (newline)
  )