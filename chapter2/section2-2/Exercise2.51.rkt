#lang racket

(require sicp)
(require sicp-pict)

; beside
(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left  (transform-painter 
                        painter1
                        (make-vect 0.0 0.0)
                        split-point
                        (make-vect 0.0 1.0)))
          (paint-right (transform-painter
                        painter2
                        split-point
                        (make-vect 1.0 0.0)
                        (make-vect 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

; like beside
(define (below painter1 painter2)
  (let ((split-point (make-vect 0 0.5)))
    (let ((paint-bottom (transform-painter
                         painter1
                         (make-vect 0 0)
                         (make-vect 1 0)
                         split-point))
          (paint-top (transform-painter
                      painter2
                      split-point
                      (make-vect 1 0.5)
                      (make-vect 0 1))))
      (lambda (frame)
        (paint-bottom frame)
        (paint-top frame)))))

; use beside and rotate
(define (below-using-beside-and-rotate painter1 painter2)
  (define (helper painter1 painter2)
    (let ((rotate270-painter1 (rotate270 painter1))
          (rotate270-painter2 (rotate270 painter2)))
      (beside rotate270-painter1 rotate270-painter2)))
  (rotate90 (helper painter1 painter2)))

(module+ main
  (paint (below einstein einstein))
  (paint (beside einstein einstein))
  (paint (below-using-beside-and-rotate einstein einstein)))