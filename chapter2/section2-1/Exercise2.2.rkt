#lang racket

(require sicp)

;Exercise2.1
(provide print-point make-point make-segment x-point y-point)

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ", ")
    (display (y-point p))
    (display ")")
    )

(define (make-point x y)
    (cons x y))

(define (x-point p)
    (car p))

(define (y-point p)
    (cdr p))

(define (make-segment start end)
    (cons start end))

(define (start-segment segment)
    (car segment))

(define (end-segment segment)
    (cdr segment))

(define (midpoint-segment segment)
    (let ((start (start-segment segment))
          (end (end-segment segment)))
      (make-point (/ (+ (x-point start) (x-point end)) 2) (/ (+ (y-point start) (+ (y-point end))) 2))
          ))

(module+ main
    (print-point (make-point 1 2))
    (let ((start (make-point 1 2))
         (end (make-point 3 4)))
         (print-point (midpoint-segment (make-segment start end)))
         )
    (let ((start (make-point 2 3))
         (end (make-point 3 4)))
         (print-point (midpoint-segment (make-segment start end)))
         )
    )