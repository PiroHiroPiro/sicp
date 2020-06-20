#lang racket

(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (midpoint-segment segment)
  (let
    (
      (start-point (start-segment segment))
      (end-point (end-segment segment))
    )
    (make-point
      (/ (+ (x-point start-point) (x-point end-point)) 2)
      (/ (+ (y-point start-point) (y-point end-point)) 2)
    )
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

(print-point (midpoint-segment (make-segment (make-point 0 4) (make-point 6 0))))
