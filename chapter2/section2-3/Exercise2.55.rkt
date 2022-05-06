#lang racket

(require sicp)

; would display 'quote
(car ''abracadabra)
(newline)
; would display quote
(display (car ''abracadabra))
(newline)
; let's see what is ''abracadabra
(display ''abracadabra) ;(quote abracadabra), or (mcons 'quote (mcons 'adasd '()))