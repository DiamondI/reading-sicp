#lang racket

;Exercise1.45

(require sicp)
(require "procedures_in_section1-3_body.rkt")
;for repeated
(require "Exercise1.43.rkt")
;for fixed-point
(require "Exercise1.35.rkt")

(define (pow a n)
  (define (iter b k result)
    (cond ((= k 0)
           result)
          ((even? k)
          (iter (square b) (/ k 2) result))
          (else
           (iter b (- k 1) (* result b)))))
  (iter a n 1))

;the least times of average damps required to be converged
;for more details, see https://zhuanlan.zhihu.com/p/25601871
(define (least-average-damp-times n)
  (define (log2 x)
    (/ (log x) (log 2)))
  (floor (log2 n)))

(define (n-th-root n x)
  (fixed-point ((repeated average-damp (least-average-damp-times n))
                (lambda (y) (/ x (pow y (- n 1)))))
                1.0))

(module+ main
  (pow 2 5) ;should be 32
  (least-average-damp-times 4); 1
  (n-th-root 5 32) ;2.000001512995761
  )