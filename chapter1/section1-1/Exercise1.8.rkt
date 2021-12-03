#lang racket
(define (cube-root-iter guess x)
  (if (new-good-enough? guess x)
      guess
      (cube-root-iter (improve guess x)
                 x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (average x y)
  (/ (+ x y) 2))

;;; 在输入很小的时候，误差会非常大，比如 0.00000001，误差会超过 200%
;;; 在输入很大的时候，很可能会进入死循环，因为 improve 的结果已经不变了
;;; 但是依然不满足 good-enough? 为真的条件，一个例子是 10,000,000,000,000
(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (new-good-enough? guess x)
  (= (improve guess x) guess))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (cube x) (* (* x x) x))

(define (cube-root x)
  (cube-root-iter 1.0 x))

(cube-root 1)
(cube-root 2)
(cube-root 3)
(cube-root 8)
(cube-root 0.001)
(cube-root 0.000000001)
(cube-root 1000000000000)