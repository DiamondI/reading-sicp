#lang sicp

;Exercise1.37

;cont-frac iterative
(define (cont-frac-iterative n d k)
  (define (iter i result)
    (if (< i 1)
        result
        (iter (- i 1) (/ (n i) (+ result (d i))))))
  (iter k 0))

;1/phi is 0.6180339887498948 calculated by python 2 / (1 + 5**0.5)
(cont-frac-iterative (lambda (i) 1.0)
           (lambda (i) 1.0)
           10) ;0.6179775280898876
(cont-frac-iterative (lambda (i) 1.0)
           (lambda (i) 1.0)
           11) ;0.6180555555555556, so k must be ge 11, to get an approximation that is accurate to 4 decimal places

;cont-frac recursive
(define (cont-frac-recursive n d k)
  (define (recurse a)
    (if (> a k)
        0
        (/ (n a) (+ (d a) (recurse (+ a 1))))))
  (recurse 1))

;1/phi is 0.6180339887498948 calculated by python 2 / (1 + 5**0.5)
(cont-frac-recursive (lambda (i) 1.0)
           (lambda (i) 1.0)
           10) ;0.6179775280898876
(cont-frac-recursive (lambda (i) 1.0)
           (lambda (i) 1.0)
           11) ;0.6180555555555556, so k must be ge 11, to get an approximation that is accurate to 4 decimal places