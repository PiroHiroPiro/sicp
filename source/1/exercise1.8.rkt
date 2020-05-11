#lang racket

(require "../utils/common.rkt")

(define (cubic-root x)
  (define (good-enough? guess x) (< (abs (- (cubic guess) x)) 0.001))
  (define (improve guess x) (/ (+ (/ x (square guess)) (double guess)) 3))
  (define (cubic-root-iter guess x) (if (good-enough? guess x) guess (cubic-root-iter (improve guess x) x)))
  (cubic-root-iter 1.0 x)
)
(cubic-root 27)
