#lang racket

(define (reverse l)
  (define (reverse-iter l r)
    (if (null? l)
      r
      (reverse-iter (cdr l) (cons (car l) r))
    )
  )
  (reverse-iter l null)
)

(reverse (list 1 4 9 16 25))
