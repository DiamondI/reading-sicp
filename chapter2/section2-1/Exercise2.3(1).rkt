#lang racket

(require sicp)
(require "Exercise2.2.rkt")

(define (square a)
  (* a a))

; the procedure of computing perimeter
(define (rect-perimeter rect)
  (* 2 (+ (rect-width rect) (rect-height rect))))

; the procedure of computing area
(define (rect-area rect)
  (* (rect-width rect) (rect-height rect)))

; distance of two points
(define (point-distance p1 p2)
  (sqrt
   (+ (square (- (x-point p1) (x-point p2)))
      (square (- (y-point p1) (y-point p2))))))

; define an implementation using origin point, width, height and angle
(define (make-rect origin width height angle)
  (cons (cons width height) (cons origin angle)))

(define (rect-width rect)
  (car (car rect)))

(define (rect-height rect)
  (cdr (car rect)))

(define (rect-origin rect)
  (car (cdr rect)))

(define (rect-angle rect)
  (cdr (cdr rect)))

; define an implementation using three points p1, p2 and p3
; p1p2 should be vertical to p2p3

(define (make-rect2 p1 p2 p3)
  (if (orthogonal? (vector-sub p1 p2) (vector-sub p2 p3))
      (cons p1 (cons p2 p3))
      (error "Points should make an rectangle.")))

; use point as vector
(define (dot-product v1 v2)
  (+ (* (x-point v1) (x-point v2))
     (* (y-point v1) (y-point v2))))

(define (vector-sub v1 v2)
  (make-point (- (x-point v1) (x-point v2))
              (- (y-point v1) (y-point v2))))

; orthogonal or not
(define (orthogonal? v1 v2)
  (= 0 (dot-product v1 v2)))


(module+ main
  (let ((origin (make-point 1 1))
        (width 4)
        (height 5)
        (angle 0.2))
    (define r1 (make-rect origin width height angle))
    (display "Rectangle 1: ") (newline)
    (display "Perimeter: ") (display (rect-perimeter r1)) (newline)
    (display "Area: ") (display (rect-area r1)) (newline)
    )
  )