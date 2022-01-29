#lang racket

(require sicp)

(define (tree-map proc items)
  (cond ((null? items) nil)
        ((not (pair? items)) (proc items))
        (else
         (cons (tree-map proc (car items))
               (tree-map proc (cdr items))))))

(define (square-tree tree)
  (define (square a)
    (* a a))
  (tree-map square tree))

(module+ main
  (define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
  (display (square-tree tree)) (newline)
  )