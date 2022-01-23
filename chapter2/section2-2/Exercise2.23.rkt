#lang racket

(require sicp)

(define (for-each procedure items)
  (if (not (null? items))
      ((lambda (x)
        (x (car items))
        (for-each x (cdr items)))procedure)))

(module+ main
  (for-each (lambda (x)
              (newline)
              (display x))
            (list 57 321 88))
  (for-each (lambda (x)
              (newline)
              (display (* x x)))
            (list 1 2 3 4))
  )