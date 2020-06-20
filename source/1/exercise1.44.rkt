#lang racket

(require "../utils/common.rkt")

(define dx 0.00001)

(define (smooth f)
  (lambda (x)
    (/
      (+
        (f (- x dx))
        (f x)
        (f (+ x dx))
      )
      3.0
    )
  )
)

(define (n-smooth f n)
  ((repeated smooth n) f)
)
