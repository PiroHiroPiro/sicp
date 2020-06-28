#lang racket

(define (make-vect x y) (cons x y))

(define (xcor-vect vect) (car vect))

(define (ycor-vect vect) (cdr vect))

(define (add-vect vect1 vect2)
  (let
    (
      ((xv1) (xcor-vect vect1))
      ((yv1) (ycor-vect vect1))
      ((xv2) (xcor-vect vect2))
      ((yv1) (ycor-vect vect1))
    )
    (cons (+ xv1 xv2) (+ yv1 yv2))
  )
)

(define (sub-vect vect1 vect2)
  (let
    (
      ((xv1) (xcor-vect vect1))
      ((yv1) (ycor-vect vect1))
      ((xv2) (xcor-vect vect2))
      ((yv1) (ycor-vect vect1))
    )
    (cons (- xv1 xv2) (- yv1 yv2))
  )
)

(define (scale-vect vect s)
  (let
    (
      ((xv) (xcor-vect vect))
      ((yv) (ycor-vect vect))
    )
    (cons (* xv s) (* yv s))
  )
)
