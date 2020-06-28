#lang racket

(define (make-vect x y) (cons x y))

(define (xcor-vect vect) (car vect))

(define (ycor-vect vect) (cdr vect))

(define (add-vect vect1 vect2)
  (make-vect (+ (xcor-vect vect1) (xcor-vect vect2)) (+ (ycor-vect vect1) (ycor-vect vect2)))
)

(define (sub-vect vect1 vect2)
  (make-vect (- (xcor-vect vect1) (xcor-vect vect2)) (- (ycor-vect vect1) (ycor-vect vect2)))
)

(define (scale-vect vect s)
  (make-vect (* (xcor-vect vect) s) (* (ycor-vect vect) s))
)


(define v1 (make-vect 1 2))
(define v2 (make-vect 3 5))

(add-vect v1 v2)
(sub-vect v1 v2)
(scale-vect v1 2)
