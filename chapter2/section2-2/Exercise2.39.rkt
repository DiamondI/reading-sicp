#lang racket

(require sicp)
(require "Exercise2.38.rkt")

(define (reverse sequence) 
  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(define (reverse-x sequence) 
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(module+ main
  (define l (list 1 2 3 4))
  (display (reverse l)) (newline)
  (display (reverse-x l)) (newline)
  )