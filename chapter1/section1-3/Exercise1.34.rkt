#lang sicp

;Exercise1.34

(define (f g) (g 2))

(define (square n) (* n n))

(f square) ;4

; would lead to error:
; application: not a procedure;
; expected a procedure that can be applied to arguments
;  given: 2
(f f)