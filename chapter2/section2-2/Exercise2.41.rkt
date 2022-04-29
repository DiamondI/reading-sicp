#lang racket

(require sicp)
(require "procedures_in_section2-2_body.rkt")

(define (triple-sum triple)
  (+ (car triple) (cadr triple) (caddr triple)))

(define (make-triple-sum triple)
  (let ((a (car triple))
        (b (cadr triple))
        (c (caddr triple)))
    (list a b c (+ a b c))))

(define (triple-sum-equal-to-s? triple s)
  (= (triple-sum triple) s))

(define (unique-triple n)
  (accumulate append nil (flatmap (lambda (k)
             (map (lambda (j)
                    (map (lambda (i) (list i j k))
                         (enumerate-interval 1 (- j 1))))
                    (enumerate-interval 2 (- k 1))))
             (enumerate-interval 3 n))))

(define (equal-to-s-triple-sum n s)
  (map make-triple-sum
        (filter (lambda (triple) (triple-sum-equal-to-s? triple s)) (unique-triple n))))

(module+ main
  (display (triple-sum-equal-to-s? (list 1 2 3) 6))
  (newline)
  (display (unique-triple 4))
  (newline)
  (display (equal-to-s-triple-sum 6 8))
  )