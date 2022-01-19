#lang racket

(require sicp)
(require "Exercise2.7.rkt")
(provide (all-from-out "Exercise2.7.rkt"))

(define (sub-interval x y)
  (add-interval x
                (make-interval
                 (* -1 (upper-bound y))
                 (* -1 (lower-bound y)))))

(module+ main
  (define interval1 (make-interval 1.0 2.0))
  (define interval2 (make-interval -2.0 3.0))
  (display "Sub interval: ") (newline)
  (print-interval (sub-interval interval1 interval2)) (newline)
  )