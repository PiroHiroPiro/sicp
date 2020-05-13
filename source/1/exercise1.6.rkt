#lang racket

(require "../utils/common.rkt")

(define (sqrt x)
  (define (good-enough? guess x) (< (abs (- (square guess) x)) 0.001))
  (define (improve guess x) (average guess (/ x guess)))
  (define (sqrt-iter guess x) (if (good-enough? guess x) guess (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x)
)
(sqrt 9)

(define (new-sqrt x)
  (define (good-enough? guess x) (< (abs (- (square guess) x)) 0.001))
  (define (improve guess x) (average guess (/ x guess)))
  (define (new-if predicate then-clause else-clause) (cond (predicate then-clause) (else else-clause)))
  (define (sqrt-iter guess x) (new-if (good-enough? guess x) guess (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x)
)
;; (new-sqrt 9)