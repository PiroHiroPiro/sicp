#lang racket

(require "../utils/common.rkt")

(define (f a b c)
  (define (lowest a b c) (and (or (= b a) (> b a)) (or (= c a) (> c a))))
  (cond ((lowest a b c) (sum-of-squares b c)) ((lowest b a c) (sum-of-squares a c)) (else (sum-of-squares a b)))
)

(f 1 2 3)
