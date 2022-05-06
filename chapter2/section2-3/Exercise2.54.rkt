#lang racket

(require sicp)

(define (equal? list1 list2)
    (if (and (pair? list1) (pair? list2))
        (and (equal? (car list1) (car list2))
            (equal? (cdr list1) (cdr list2)))
        (eq? list1 list2)))

(module+ main
    (define list1 '(1 2 3))
    (define list2 '(1 2 3))
    (display (equal? list1 list2))
    (newline)
    (define symbol-list1 '(a b c))
    (define symbol-list2 '(a b c))
    (display (equal? symbol-list1 symbol-list2))
    (newline)
    (display (equal? '(1 2 3 (4 5) 6) '(1 2 3 (4 5) 6)))
    (newline)
    (display (equal? '(1 2 3 (4 5) 6) '(1 2 3 (4 5 7) 6))))