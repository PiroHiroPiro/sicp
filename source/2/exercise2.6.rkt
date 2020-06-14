#lang racket

(define (inc n) (+ n 1))

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x))))
)

(define one
  (lambda (f) (lambda (x) (f x)))
)

(define two
  (lambda (f) (lambda (x) (f (f x))))
)

((zero inc) 0)
((one inc) 0)
((two inc) 0)
(((add-1 one) inc) 0)

(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x))))
)

(((add one two) inc) 0)
