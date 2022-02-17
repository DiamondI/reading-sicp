#lang racket

(require sicp)
(require "procedures_in_section2-2_body.rkt")
(require "Exercise2.28.rkt")

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (fringe t))))

(module+ main
  (define tree (list (list 1 2 3 (list 4 5 6) 7 8 9)))
  (display (map fringe tree)) (newline)
  (display (count-leaves tree))
  )