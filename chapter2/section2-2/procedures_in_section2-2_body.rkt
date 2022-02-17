#lang racket

(require sicp)
(provide (all-defined-out))

(define (accumulate op initial sequence)
  (if (null? sequence) initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(module+ main
  (define list1 (list 1 2 3 4))
  (define list2 (list 2 4 6 8))
  (display (append list1 list2))
  )