#lang racket

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2)
)

(define (origin-frame frame)
  (car frame)
)

(define (edge1-frame frame)
  (cadr frame)
)

(define (edge2-frame frame)
  (caddr frame)
)


(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2))
)

(define (origin-frame frame)
  (car frame)
)

(define (edge1-frame frame)
  (cadr frame)
)

(define (edge2-frame frame)
  (cddr frame)
)


(define (make-vect x y) (cons x y))
(define v0 (make-vect 1 2))
(define v1 (make-vect 2 4))
(define v2 (make-vect 4 8))
(define f (make-frame v0 v1 v2))

(origin-frame f)
(edge1-frame f)
(edge2-frame f)
