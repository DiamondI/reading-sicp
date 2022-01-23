#lang racket

(require sicp)

(define (reverse l)
  (let((left (car l))
      (right (cdr l)))
    (if (null? right)
        l
        (append (reverse right) (cons left nil))))) ; left is element, while right is the remained list

; iterative version
(define (reverse-iterative l)
  (define (reverse l res)
    (if (null? l)
        res
        (reverse (cdr l) (append (cons (car l) nil) res))))
  (reverse l nil))

(module+ main
  (display (reverse (list 1 2 3 5))) (newline)
  (display (reverse-iterative (list 1 2 3 5)))
  )