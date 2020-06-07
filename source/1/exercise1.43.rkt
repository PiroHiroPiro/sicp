#lang racket

(require "../utils/common.rkt")

; (define (compose f g)
;   (lambda (x) (f (g x)))
; )

(define (repeated f n)
  (if (= n 1)
    (lambda (x) (f x))
    (lambda (x) (f ((repeated f (- n 1)) x)))
    ; (compose f (repeated f (- n 1)))
  )
)

((repeated square 2) 5) ; 625
