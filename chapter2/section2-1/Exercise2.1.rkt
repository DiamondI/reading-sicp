#lang racket

(require sicp)
(require "procedures_used_in_section2-1_body.rkt")

;Exercise2.1

(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d))))
    (let ((n (/ n g))
          (d (/ d g)))
        (cons
         (if (> (* n d) 0)
             (abs n)
             (- (abs n)))
         (abs d)))))

(module+ main
  (print-rat (make-rat 2 -3))
  (print-rat (make-rat -2 -3))
  (define one-third (make-rat -1 -3))
  (print-rat (add-rat one-third one-third))
  )