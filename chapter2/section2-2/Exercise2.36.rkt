#lang racket

(require sicp)
(require "procedures_in_section2-2_body.rkt")
(provide accumulate-n)
(provide (all-from-out "procedures_in_section2-2_body.rkt"))
  

(define (accumulate-n op init seqs) 
  (if (null? (car seqs))
	  nil 
	  (cons (accumulate op init (map car seqs)) 
			(accumulate-n op init (map cdr seqs)))))

(module+ main
  (define seqs (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
  (display seqs) (newline)
  (display (accumulate-n + 0 seqs))
  )