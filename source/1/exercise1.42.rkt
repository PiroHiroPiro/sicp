#lang racket

(require "../utils/common.rkt")

(define (compose f g)
  (lambda (x) (f (g x)))
)

((compose square inc) 6) ; 49
