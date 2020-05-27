#lang racket

(require "../utils/common.rkt")

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a) (sum term (next a) next b))
  )
)

; (define (integral f a b dx)
;   (define (add-dx x)
;     (+ x dx)
;   )
;   (* (sum f (+ a (/ dx 2.0)) add-dx b) dx)
; )

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (simpson-term x) (* (if (eval x) 2 4) (y x)))
  (define (simpson-next x) (+ x 1))
  (* (/ h 3.0) (+ (y 0) (sum simpson-term (simpson-next a) simpson-next n) (y n)))
)

; (integral cube 0 1 0.01) ; 0.24998750000000042
; (integral cube 0 1 0.001) ; 0.249999875000001

(simpson cube 0 1 100)
(simpson cube 0 1 1000)
