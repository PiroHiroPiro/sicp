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

(define (width-segment segment)
  (let
    (
      (start-point (start-segment segment))
      (end-point (end-segment segment))
    )
    (abs (- (x-point end-point) (x-point start-point)))
  )
)
(define (height-segment segment)
  (let
    (
      (start-point (start-segment segment))
      (end-point (end-segment segment))
    )
    (abs (- (y-point end-point) (y-point start-point)))
  )
)

(define (perimeter-segment segment)
  (* 2 (+ (width-segment segment) (height-segment segment)))
)

(define (area-segment segment)
  (* (width-segment segment) (height-segment segment))
)

(define s (make-segment (make-point 0 4) (make-point 6 0)))
(perimeter-segment s)
(area-segment s)
