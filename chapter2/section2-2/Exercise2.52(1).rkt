#lang racket

(require sicp)
(require sicp-pict)

 (define x 1.5) 
 (define y 1.8)

;; Define helper functions 
;; takes a list of coords with the format x1 y1 x2 y2 and normalises them wrt measurements 
(define (normalize coords) 
  (let ((x1 (car coords)) 
        (y1 (cadr coords)) 
        (x2 (caddr coords)) 
        (y2 (cadddr coords))) 
    (list (/ x1 x) (/ y1 y) (/ x2 x) (/ y2 y))))  
 
;; symmetry will be useful 
(define (mirror coords) 
  (list (- x (car coords)) (cadr coords) (- x (caddr coords)) (cadddr coords)))  
 
;; takes a list of coords converts to a line segment 
(define (list->line coords) 
  (let ((x1 (car coords)) 
        (y1 (cadr coords)) 
        (x2 (caddr coords)) 
        (y2 (cadddr coords))) 
    (segment (vect x1 y1) (vect x2 y2)))) 
 
;; define wave coords
(define wave-coords 
  (list 
   (list 0.5 1.5 0.65 y) 
   (mirror (list 0.5 1.5 0.65 y)) 
   (list 0.5 1.5 0.65 1.2) 
   (mirror (list 0.5 1.5 0.65 1.2)) 
   (list 0.5 1.22 0.65 1.2) ;; left neck (0.65 1.2) 
   (mirror (list 0.5 1.22 0.65 1.2)) 
   (list 0.5 1.22 0.3 1.05) 
   (mirror (list 0.5 1.22 0.3 1.05)) 
   (list 0.3 1.05 0.0 1.35) 
   (list (- x 0.3) 1.05 x 0.65) 
   (list 0.4 0 0.55 1) ;; left armpit (0.55 1) 
   (mirror (list 0.4 0 0.55 1)) 
   (list 0.55 1 0.25 0.85) 
   (mirror (list 0.4 0 0.55 1)) 
   (list 0.25 0.85 0 1.15) 
   (list (- x 0.55) 1 x 0.5) 
   (list 0.6 0 0.7 0.5) 
   (mirror (list 0.6 0 0.7 0.5)) 
   (list 0.7 0.5 (/ x 2) 0.58)
   ; v smile
   (list 0.65 1.45 0.75 1.3)
   (list 0.75 1.3 0.85 1.45)
   (mirror (list 0.7 0.5 (/ x 2) 0.58))))
 
(define wave 
  (segments->painter 
   (map list->line (map normalize wave-coords))))

(module+ main
  (paint wave))