#lang racket

(require sicp)

(define (deep-reverse items)        
  (define (helper items res)
    (if (not (pair? items))
        res
        (let ((left (car items))
              (right (cdr items)))
          (helper right
                  (if (pair? left)
                      (cons (deep-reverse left) res)
                      (cons left res))))))
  (if (not (pair? items))
      items
      (helper items nil)))


(module+ main
  (define x (list (list 1 2) (list 3 4)))
  (define y (list 1 2 3 4))
  (define z (list 1 2 (list 3 4)))
  (define tripple (list 4 5 (list 6 7 (list 1 2 3))))
  (define not-pair 6)
  (display (deep-reverse x)) ;should be ((4 3) (2 1))
  (newline)
  (display (deep-reverse y)) ;should be (4 3 2 1)
  (newline)
  (display (deep-reverse z)) ;should be ((4 3) 2 1)
  (newline)
  (display (deep-reverse not-pair)); should be 6
  (newline)
  (display (deep-reverse tripple)); should be (((3 2 1) 7 6) 5 4)
  )