#lang racket

(require sicp-pict)

(define (split op1 op2)
  (define (helper painter n)
	  (if (= n 0)
		  painter
		  (let ((smaller (helper painter (- n 1))))
			  (op1 painter (op2 smaller smaller)))))
  helper)

(module+ main
  (define right-split (split beside below))
  (define up-split (split below beside))
  (paint (right-split einstein 3))
  (paint (up-split einstein 3)))