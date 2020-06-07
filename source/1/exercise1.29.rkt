#lang racket

(require "../utils/common.rkt")

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a) (sum term (next a) next b))
  )
)

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx)
  )
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx)
)

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (simpson-term k)
    (*
      (cond
        ((or (= k 0) (= k n)) 1)
        ((even? k) 2)
        (else 4)
      )
      (f (+ a (* k h)))
    )
  )
  (define (simpson-next k) (+ k 1))
  (* (/ h 3.0) (sum simpson-term (simpson-next a) simpson-next n))
)

(integral cube 0 1 0.01) ; 0.24998750000000042
(integral cube 0 1 0.001) ; 0.249999875000001
(simpson cube 0 1 100) ; 0.25
(simpson cube 0 1 1000) ; 0.25
