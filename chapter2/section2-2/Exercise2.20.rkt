#lang racket

(require sicp)

(define (same-parity first . left)
  (define (helper parity l res)
    (if (null? l)
        res
        (let ((ele (car l))
              (remain (cdr l)))
          (if (parity ele)
              (helper parity remain (append res (cons ele nil)))
              (helper parity remain res)))))
  (cons first
        (if (even? first)
            (helper even? left nil)
            (helper odd? left nil))))

(module+ main
  (display (same-parity 1 2 3 4 5 6 7)) (newline)
  (display (same-parity 2 3 4 5 6 7))
  )
  