#lang racket

(define (enumerate-tree tree)
  (cond
    ((null? tree) null)
    ((not (pair? tree)) (list tree))
    (else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))
  )
)

(enumerate-tree (list 1 (list 2 (list 3 4)) 5))

(define (filter predicate sequence)
  (cond
    ((null? sequence) null)
    ((predicate (car sequence)) (cons (car sequence)(filter predicate (cdr sequence))))
    (else (filter predicate (cdr sequence)))
  )
)

(filter odd? (list 1 2 3 4 5))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence) (accumulate op initial (cdr sequence)))
  )
)

(accumulate + 0 (list 1 2 3 4 5))
(accumulate * 1 (list 1 2 3 4 5))
(accumulate cons null (list 1 2 3 4 5))
