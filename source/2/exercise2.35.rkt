#lang racket

(require "../utils/common.rkt")

(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1) (enumerate-tree t)))
)

(define x (cons (list 1 2) (list 3 4)))
(count-leaves x)
(count-leaves (list x x))
