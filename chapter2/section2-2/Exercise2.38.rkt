#lang racket

(require sicp)
(require "Exercise2.36.rkt")
(provide fold-left fold-right)

(define (fold-left op initial sequence) 
  (define (iter result rest) 
	(if (null? rest) 
		result 
		(iter (op result (car rest)) 
			  (cdr rest)))) 
  (iter initial sequence))

(define fold-right accumulate)

(module+ main
  (display (fold-right / 1 (list 1 2 3))) (newline)
  (display (fold-left / 1 (list 1 2 3))) (newline)
  (display (fold-right list nil (list 1 2 3))) (newline)
  (display (fold-left list nil (list 1 2 3))) (newline)
  (display (fold-left append nil (list '(1) '(2 3) '() '(4)))) (newline)   ;; (1 2 3 4) 
  (display (fold-right append nil (list '(1) '(2 3) '() '(4)))) (newline)
  (display (list '(1) '(2 3) '() '(4)))
  )