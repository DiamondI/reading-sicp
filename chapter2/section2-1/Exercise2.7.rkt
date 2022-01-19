#lang racket

(require sicp)
(provide (all-defined-out))

(define (make-interval a b) (cons a b))

(define (add-interval x y) 
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))

(define (mul-interval x y) 
  (let ((p1 (* (lower-bound x)
               (lower-bound y))) 
		(p2 (* (lower-bound x)
                       (upper-bound y))) 
		(p3 (* (upper-bound x)
                       (lower-bound y))) 
		(p4 (* (upper-bound x)
                       (upper-bound y)))) 
	(make-interval (min p1 p2 p3 p4)
                       (max p1 p2 p3 p4))))

(define (div-interval x y) 
  (mul-interval x
                (make-interval
                 (/ 1.0 (upper-bound y))
                 (/ 1.0 (lower-bound y)))))

(define (lower-bound interval)
  (car interval))

(define (upper-bound interval)
  (cdr interval))

(define (print-interval interval)
  (let ((a (lower-bound interval))
        (b (upper-bound interval)))
    (display "(")
    (display a)
    (display ", ")
    (display b)
    (display ")")))

(module+ main
  (define interval1 (make-interval 1.0 2.0))
  (define interval2 (make-interval -2.0 3.0))
  (display "Add interval: ")(newline)
  (print-interval (add-interval interval1 interval2)) (newline)
  (display "Mul interval: ") (newline)
  (print-interval (mul-interval interval1 interval2)) (newline)
  (display "Div interval: ") (newline)
  (print-interval (div-interval interval1 interval2)) (newline)
  )