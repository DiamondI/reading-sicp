#lang racket

(require sicp)
(require "procedures_in_section2-2_body.rkt")

(define empty-board nil)

; (list row k) to represent a position
; information k is also encoded in position
(define (adjoin-position new-row k rest-of-queens)
  (cons (list new-row k) rest-of-queens))

(define (queen-in-kth-row k positions)
  (cond ((null? positions) nil)
        ((= (cadar positions) k)
         (car positions))
        (else (queen-in-kth-row k (cdr positions)))))
        
(define (queens-not-in-kth-row k positions)
  (cond ((null? positions) nil)
        ((= (cadar positions) k)
         (cdr positions))
        (else (cons (car positions)
                    (queens-not-in-kth-row k (cdr positions))))))

; positions is list of position
; ((row1 k1) (row2 k2) ...)
(define (safe? k positions)
  ; only need to check the k-th position
  (let ((kth-row (queen-in-kth-row k positions))
        (not-kth-rows (queens-not-in-kth-row k positions)))
    (null? (filter (lambda (not-kth-row)
                     (or (= (car not-kth-row) (car kth-row))
                         (= (- (car not-kth-row) (cadr not-kth-row))
                            (- (car kth-row) (cadr kth-row)))
                         (= (+ (car not-kth-row) (cadr not-kth-row))
                            (+ (car kth-row) (cadr kth-row)))))
                   not-kth-rows))))
  

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) 
           (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position 
                    new-row 
                    k 
                    rest-of-queens))
                 (enumerate-interval 
                  1 
                  board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(module+ main
  (length (queens 8)) ;92
  (newline)
  (length (queens 11)) ;2680
  )