#lang racket

(require sicp)
(require "Exercise2.8.rkt")
(provide (all-from-out "Exercise2.8.rkt"))
(provide div-interval)

(define (div-interval x y)
  (let ((start (lower-bound y))
        (end (upper-bound y)))
    (if (= start end)
        (error "Can't divide by an interval with spans 0")
        (mul-interval x
                      (make-interval
                       (/ 1.0 (upper-bound y))
                       (/ 1.0 (lower-bound y)))))))

(module+ main
  (define interval1 (make-interval 1.0 2.0))
  (define interval2 (make-interval -2.0 3.0))
  (define interval3 (make-interval 0 0))
  (display "Div interval (no error): ") (newline)
  (print-interval (div-interval interval1 interval2)) (newline)
  (display "Div interval (error): ") (newline)
  (print-interval (div-interval interval1 interval3))
  )

