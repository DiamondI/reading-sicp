#lang racket

(require sicp)
(require "procedures_in_section2-2_body.rkt")

(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum? (unique-pairs n))))

(module+ main
  (display (prime-sum-pairs 6))
  )