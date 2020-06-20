#lang racket

(require "../utils/common.rkt")

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ (term a) result))
    )
  )
  (iter a 0)
)

(define (pi-sum a b)
  (define (pi-term x) (/ 1.0 (* x (+ x 2))))
  (define (pi-next x) (+ x 4))
  (sum pi-term a pi-next b)
)

(* 8 (pi-sum 1 1000)) ; 3.139592655589783 -> 3.139592655589782
