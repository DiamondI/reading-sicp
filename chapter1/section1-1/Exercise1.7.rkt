#lang racket
(define (sqrt-iter guess x)
  (if (new-good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;;; 在输入很小的时候，误差会非常大，比如 0.00000001，误差会超过 200%
;;; 在输入很大的时候，很可能会进入死循环，因为 improve 的结果已经不变了
;;; 但是依然不满足 good-enough? 为真的条件，一个例子是 10,000,000,000,000
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (new-good-enough? guess x)
  (= (improve guess x) guess))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (square x) (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 10000000000000)
(sqrt 0.00000000000000000001)
(sqrt 0)
(sqrt 9)
(sqrt -1)