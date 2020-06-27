#lang racket

(require "../utils/common.rkt")

(define (dot-product v w)
  (accumulate + 0 (map * v w))
)

(define (matrix-*-vector m v)
  (map (lambda (mi) (dot-product v mi)) m)
)

(define (transpose mat)
  (accumulate-n cons null mat)
)

(define (matrix-*-matrix m n)
  (let
    ((cols (transpose n)))
    (map (lambda (v) (matrix-*-vector cols v)) m)
  )
)

(define v (list 1 2))
(define m (list (list 2 3) (list 1 2)))
(dot-product v v)
(matrix-*-vector m v)
(transpose m)
(matrix-*-matrix m m)
