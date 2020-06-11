#lang racket

(require "../utils/common.rkt")

(define (make-segment x y) (cons x y))
(define (x-point s) (car s))
(define (y-point s) (cdr s))
(define (midpoint-segment s1 s2)
  (make-segment
    (/ (+ (x-point s1) (x-point s2)) 2)
    (/ (+ (y-point s1) (y-point s2)) 2)
  )
)

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline)
)

(define start-segment (make-segment 0 4))
(define end-segment (make-segment 6 0))

(print-point start-segment)
(print-point end-segment)
(print-point (midpoint-segment start-segment end-segment))
