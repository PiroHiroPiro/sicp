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

; (define (simpson f a b n)
;   (define h (/ (- b a) n))
;   (define (simpson-term k)
;     (*
;       (cond
;         ((or (= k 0) (= k n)) 1)
;         ((eval k) 2)
;         (else 4)
;       )
;       (f (+ a (* k h)))
;     )
;   )
;   (define (simpson-next k) (+ k 1))
;   (* (/ h 3.0) (sum simpson-term a simpson-next b))
; )

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  ; (define (simpson-term k) (* (if (eval k) 2 4) (y k)))
  (define (simpson-term i) (if (eval i) (* 2 (y i)) (* 4 (y i))))
  (define (simpson-next x) (+ x 1))
  (* (/ h 3.0) (+ (y 0) (sum simpson-term a simpson-next n) (y n)))
)

(define (integral-with-simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (simpson-term i) (if (even? i) (* 2 (y i)) (* 4 (y i))))
  (define (simpson-next x) (+ x 1))
  (* (/ h 3.0) (+ (y 0) (sum simpson-term a simpson-next n) (y n)))
)

; (integral cube 0 1 0.01) ; 0.24998750000000042
; (integral cube 0 1 0.001) ; 0.249999875000001
(integral-with-simpson cube 0 1 100)
(integral-with-simpson cube 0 1 1000)
(simpson cube 0 1 100)
; (simpson cube 0 1 1000)

; (define (cube x) (* x x x))

; (define (inc x) (+ x 1))

; (define (sum term a next b)
;   (if (> a b)
;       0
;       (+ (term a)
;          (sum term (next a) next b))))

; (define (integral-with-simpson f a b n)
;   (define h
;     (/ (- b a) n))
;   (define (y k)
;     (f (+ a (* k h))))
;   (define (term i)
;     (if (even? i)
;         (* 2 (y i))
;         (* 4 (y i))))
;   (* (/ h 3.0)
;      (+ (y 0)
;         (sum term a inc n)
;         (y n))))
