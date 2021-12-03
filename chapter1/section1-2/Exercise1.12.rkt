#lang racket
;;; row from 0 and col from 0
(define (pascal-rc row col)
  (if (> col row)
      0
      (if (or (= row 0) (= col 0) (= row col))
          1
          (+ (pascal-rc (- row 1) col) (pascal-rc (- row 1) (- col 1))))))

(pascal-rc 0 0)
(pascal-rc 1 0)
(pascal-rc 1 1)
(pascal-rc 2 1)
(pascal-rc 3 1)
(pascal-rc 3 2)
(pascal-rc 4 1)
(pascal-rc 4 2)