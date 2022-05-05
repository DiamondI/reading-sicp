#lang racket

(require sicp)
(provide (all-defined-out))

(define (make-vect x y)
  (list x y))

(define (xcor-vect vect)
  (car vect))

(define (ycor-vect vect)
  (cadr vect))

(define (binary-op op v1 v2)
  (let ((x1 (xcor-vect v1))
        (x2 (xcor-vect v2))
        (y1 (ycor-vect v1))
        (y2 (ycor-vect v2)))
    (make-vect (op x1 x2) (op y1 y2))))

(define (add-vect v1 v2)
  (binary-op + v1 v2))

(define (sub-vect v1 v2)
  (binary-op - v1 v2))

(define (scale-vect s v)
  (let ((x (xcor-vect v))
        (y (ycor-vect v)))
    (make-vect (* s x) (* s y))))

(module+ main
  (define v (make-vect 1 2))
  (define u (make-vect 3 4))
  (display v)
  (newline)
  (display (make-vect (xcor-vect v) (ycor-vect v)))
  (newline)
  (display (add-vect v u))
  (newline)
  (display (sub-vect u v))
  (newline)
  (display (scale-vect 3 u)))