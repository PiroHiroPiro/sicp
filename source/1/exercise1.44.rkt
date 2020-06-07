#lang racket

(require "../utils/common.rkt")

(define (repeated f n)
  (if (= n 1)
    (lambda (x) (f x))
    (compose f (repeated f (- n 1)))
  )
)

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
