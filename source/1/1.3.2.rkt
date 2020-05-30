#lang racket

(require "../utils/common.rkt")

(define (f x y)
  (define (f-helper a b)
    (+
      (* x (square a))
      (* y b)
      (* a b)
    )
  )
  (f-helper (+ 1 (* x y)) (- 1 y))
)

(define (f x y)
  (
    (lambda (a b)
      (+
        (* x (square a))
        (* y b)
        (* a b)
      )
    )
    (+ 1 (* x y))
    (- 1 y)
  )
)

(define (f x y)
  (let
    (
      (a (+ 1 (* x y)))
      (b (- 1 y))
    )
    (+
      (* x (square a))
      (* y b)
      (* a b)
    )
  )
)
