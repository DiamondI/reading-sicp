#lang racket

(define (square x) (* x x))

(define (fib n)
  ;(fib-iter 1 0 0 1 n))
  (fib-iter-new 1 0 1 1 1 0 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) 
         b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q));compute p'
                   (+ (* 2 p q) (square q));compute q'
                   (/ count 2)))
        (else 
         (fib-iter (+ (* b q) 
                      (* a q) 
                      (* a p))
                   (+ (* b p) 
                      (* a q))
                   p
                   q
                   (- count 1)))))

(define (fib-iter-new a b p q s t count)
  (cond ((= count 0)
         b)
        ((even? count)
         (fib-iter-new a
                       b
                       (+ (square p) (* s q)) ;p
                       (+ (* p q) (* q t)) ;q
                       (+ (* s p) (* s t)) ;s
                       (+ (* s q) (square t)) ;t
                       (/ count 2)))
         (else
          (fib-iter-new (+ (* a p)
                           (* b q))
                        (+ (* a s)
                           (* b t))
                        p
                        q
                        s
                        t
                        (- count 1)))))

;tesing
(fib 1)  ;1
(fib 2)  ;1
(fib 3)  ;2
(fib 4)  ;3
(fib 5)  ;5
(fib 6)  ;8
(fib 7)  ;13
(fib 8)  ;21
(fib 9)  ;34
(fib 10) ;55


