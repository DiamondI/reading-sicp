#lang racket

(require sicp)
(require "Exercise2.46.rkt")

; start-point and end-point are vectors
(define (make-segment start-point end-point)
  (list start-point end-point))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cadr segment))

(module+ main
  (define start-point (make-vect 0 0))
  (define end-point (make-vect 1 1))
  (define segment (make-segment start-point end-point))
  (display segment)
  (newline)
  (display (start-segment segment))
  (newline)
  (display (end-segment segment)))