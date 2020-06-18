#lang racket

(require "../utils/common.rkt")

(define (for-each proc items)
  (when (not (null? items))
    (and (proc (car items)) (for-each proc (cdr items)))
  )
)

(for-each (lambda (x) (display x) (newline)) (list 57 321 88))
