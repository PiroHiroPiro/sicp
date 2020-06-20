#lang racket

(require "../utils/common.rkt")

(define (last-pair l)
  (if (null? (cdr l))
    (car l)
    (last-pair (cdr l))
  )
)


(last-pair (list 23 72 149 34))
