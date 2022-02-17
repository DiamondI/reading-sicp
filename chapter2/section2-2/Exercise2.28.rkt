#lang racket

(require sicp)
(provide fringe)

(define (fringe items)
  (cond ((null? items)
         nil)
        ((not (pair? items))
         (list items))
        (else
         (let ((left (car items))
               (right (cdr items)))
           (append (fringe left) (fringe right))))))

(module+ main
  (define l1 (list (list 1 2) (list 1 (list 3 4))))
  (define x (list (list 1 2) (list 3 4)))
  (display (fringe l1)) (newline)
  (display (fringe x)) (newline)
  (display (fringe (list x x))) (newline)
  )