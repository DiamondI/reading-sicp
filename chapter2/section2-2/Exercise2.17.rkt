#lang racket

(require sicp)

; l is nonempty
(define (last-pair l)
  (let ((right (cdr l)))
    (if (null? right)
        l
        (last-pair right))))

(module+ main
  (display (last-pair (list 1 2 3 4))) ;(4)
  (newline)
  (display (last-pair (list 23 72 149 34))) ;(34)
  )