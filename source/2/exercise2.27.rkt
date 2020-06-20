#lang racket

(define x (list (list 1 2) (list 3 4)))
; => ((1 2) (3 4))

(reverse x)
; => ((3 4) (1 2))

(define (deep-reverse l)
  (define (deep-reverse-iter l r)
    (cond
      ((null? l) r)
      ((pair? (car l)) (deep-reverse-iter (cdr l) (append (list (deep-reverse (car l))) r)))
      (else (deep-reverse-iter (cdr l) (append (list (car l)) r)))
    )
  )
  (deep-reverse-iter l null)
)

(deep-reverse x)
; => ((4 3) (2 1))
