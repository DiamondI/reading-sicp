#lang racket

(require sicp)

(module+ main
  (define x (list 1 2 3)) 
  (define y (list 4 5 6))
  (let ((a1 (append x y))
        (a2 (cons x y))
        (a3 (list x y)))
    (display a1) (newline)
    (display a2) (newline)
    (display a3) (newline))
  )