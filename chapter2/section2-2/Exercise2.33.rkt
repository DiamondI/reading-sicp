#lang racket

(require sicp)
(require "procedures_in_section2-2_body.rkt")

(define (map p sequence) 
  (accumulate (lambda (x y) (cons (p x) y))
			  nil sequence))

(define (append seq1 seq2) 
  (accumulate cons seq2 seq1))

(define (length sequence) 
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(module+ main
  (display (map (lambda (x) (* x x)) (list 1 2 3 4))) (newline)
  (display (append (list 1 2 3 4) (list 4 3 2 1))) (newline)
  (display (length (list 1 2 3 4)))
  )