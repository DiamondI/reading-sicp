#lang racket

(require sicp)

;procedure appears in section2-1
(provide (all-defined-out))
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

;(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

;test rational-number procedures
(module+ main
  (define one-half (make-rat 1 2))
  (print-rat one-half)
  (define one-third (make-rat 1 3))
  (print-rat one-third)
  (print-rat (add-rat one-half one-third))
  (print-rat (mul-rat one-half one-third))
  ;(print-rat (add-rat one-third one-third));return 6/9, not 2/3
  (let ((one-third (make-rat 1 3)))
    (print-rat (add-rat one-third one-third)));should return 2/3
  )