#lang racket

(require "../utils/common.rkt")

(define (last-pair l)
  (define (last-pair-iter l e)
    (if (null? l)
      e
      (last-pair-iter (cdr l) (car l))
    )
  )
  (last-pair-iter (cdr l) (car l))
)

(last-pair (list 23 72 149 34))
