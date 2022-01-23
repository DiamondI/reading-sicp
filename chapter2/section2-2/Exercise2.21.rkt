#lang racket

(require sicp)

(define (square a)
  (* a a))

(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)))))

(define (square-list-with-map items)
  (map (lambda (x) (square x)) items))

(module+ main
  (define list1 (list 1 2 3 5))
  (display (square-list list1)) (newline)
  (display (square-list-with-map list1))
  )