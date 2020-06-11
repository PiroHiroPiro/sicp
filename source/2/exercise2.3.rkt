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

(define (perimeter-segments s1 s2)
  (double
    (+
      (abs (- (x-point s2) (x-point s1)))
      (abs (- (y-point s2) (y-point s1)))
    )
  )
)
(define (area-segments s1 s2)
  (abs (*
    (- (x-point s2) (x-point s1))
    (- (y-point s2) (y-point s1))
  ))
)

(define a (make-segment 0 4))
(define b (make-segment 6 0))
(perimeter-segments a b)
(area-segments a b)

(define (make-rectangle s1 s2) (cons s1 s2))
(define (start-rectangle r) (car r))
(define (end-rectangle r) (cdr r))
(define (perimeter-rectangle r)
  (let
    (
      (sx (x-point (start-rectangle r)))
      (sy (y-point (start-rectangle r)))
      (ex (x-point (end-rectangle r)))
      (ey (y-point (end-rectangle r)))
    )
    (double
      (+
        (abs (- ex sx))
        (abs (- ey sy))
      )
    )
  )
)
(define (area-rectangle r)
  (let
    (
      (sx (x-point (start-rectangle r)))
      (sy (y-point (start-rectangle r)))
      (ex (x-point (end-rectangle r)))
      (ey (y-point (end-rectangle r)))
    )
    (abs (* (- ex sx) (- ey sy)))
  )
)

(define rect (make-rectangle a b))
(print-point (start-rectangle rect))
(print-point (end-rectangle rect))
(perimeter-rectangle rect)
(area-rectangle rect)
