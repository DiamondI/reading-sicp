#lang racket

(require sicp)
(require "Exercise2.36.rkt")

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product v x)) m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (matrix-*-vector cols x)) m)))

(module+ main
  (define matrix (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))
  (define vector (list 2 3 4 5))
  (display (matrix-*-vector matrix vector)) (newline)
  (display (transpose matrix)) (newline)
  (display (matrix-*-matrix matrix (transpose matrix)))
  )