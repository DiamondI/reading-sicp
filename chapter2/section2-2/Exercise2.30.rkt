#lang racket

(require sicp)

; without high-order procedures
(define (square-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

; use map
(define (square-tree-with-map tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (square-tree-with-map subtree)
             (* subtree subtree))) tree))


(module+ main
  (define tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))
  (display (square-tree tree)) (newline)
  (display (square-tree-with-map tree))
  )