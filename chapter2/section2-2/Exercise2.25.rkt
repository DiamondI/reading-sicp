#lang racket

(require sicp)

;(1 3 (5 7) 9) 
;((7)) 
;(1 (2 (3 (4 (5 (6 7))))))

(module+ main
  (let ((tree1 (list 1 3 (list 5 7) 9))
        (tree2 (list (list 7)))
        (tree3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7))))))))
    (display tree1) (newline)
    (display (cadar (cddr tree1))) (newline)
    (display tree2) (newline)
    (display (caar tree2)) (newline)
    (display tree3) (newline)
    (display (cadadr (cadadr (cadadr tree3))))
    )
  )