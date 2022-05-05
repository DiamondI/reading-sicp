#lang racket

(require sicp)
(require sicp-pict)

; using vector-sub in sicp-pict as sub-vect
(define sub-vect vector-sub)

(define (flip-horiz painter)
  (transform-painter painter
                     (make-vect 1 0)
                     (make-vect 0 0)
                     (make-vect 1 1)))

(define (rotate180 painter)
  (transform-painter painter
                     (make-vect 1 1)
                     (make-vect 0 1)
                     (make-vect 1 0)))

(define (rotate270 painter)
  (transform-painter painter
                     (make-vect 0 1)
                     (make-vect 0 0)
                     (make-vect 1 1)))

(module+ main
  (paint einstein) ;origin ((0 0) (1 0) (0 1))
  (paint (flip-horiz einstein)) ;flip-horiz
  (paint (rotate180 einstein)) ;rotate180
  (paint (rotate270 einstein)) ;rotate270
  )