#lang racket

(require sicp)

(define (square a)
  (* a a))

; wrong version
(define (square-list items)
  (define (iter things answer) 
	(if (null? things) 
		answer 
		(iter (cdr things) 
			  (cons answer 
					(square (car things)))))) 
  (iter items nil))

; correct version
(define (square-list-modified items)
  (define (iter things answer) 
	(if (null? things) 
		answer 
		(iter (cdr things) 
			  (append answer 
					(cons (square (car things)) nil))))) 
  (iter items nil))

(module+ main
  (define list1 (list 1 2 3 5))
  (display (square-list list1)) (newline)
  (display (square-list-modified list1))
  )