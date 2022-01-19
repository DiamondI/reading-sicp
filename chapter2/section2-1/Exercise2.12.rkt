#lang racket

(require sicp)
(require "Exercise2.11.rkt")
(provide (all-from-out "Exercise2.11.rkt"))
(provide (all-defined-out))

(define (make-center-percent center percentage)
  (let ((width (/ (* center percentage) 100)))
    (make-interval (- center width) (+ center width))))

(define (center interval)
  (/ (+ (lower-bound interval)
        (upper-bound interval))
     2))

(define (percentage interval)
  (let ((c (center interval))
        (l (lower-bound interval)))
    (* 100 (/ (- c l) c))))

(module+ main
  (define interval (make-center-percent 10.0 5))
  (print-interval interval) (newline)
  (display (center interval)) (newline)
  (display (percentage interval))
  )