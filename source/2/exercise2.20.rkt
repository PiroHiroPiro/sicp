#lang racket

(require "../utils/common.rkt")

(define (reverse l)
  (define (reverse-iter l r)
    (if (null? l)
      r
      (reverse-iter (cdr l) (cons (car l) r))
    )
  )
  (reverse-iter l nil)
)

(define (same-parity . l)
  (let
    ((parity? (if (even? (car l)) even? odd?)))
    (define (same-parity-iter l spl)
      (if (null? l)
        (reverse spl)
        (same-parity-iter (cdr l) (if (parity? (car l)) (cons (car l) spl) spl))
      )
    )
    (same-parity-iter l nil)
  )
)

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
