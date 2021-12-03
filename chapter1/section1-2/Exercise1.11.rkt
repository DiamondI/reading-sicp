#lang racket
;;; recursive implementation
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))

(f -1)
(f 1)
(f 2)
(f 3)
(f 4)
(f 10)

;;; iterative implementation
(define (f-iter a b c count)
  (if (= count 0)
      a
      (f-iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))

(define (ff n)
  (if (< n 3)
      n
      (f-iter 0 1 2 n)))
      

(ff -1)
(ff 1)
(ff 2)
(ff 3)
(ff 4)
(ff 10)