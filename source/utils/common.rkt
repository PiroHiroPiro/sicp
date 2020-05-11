#lang racket

(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (average x y) (/ (+ x y) 2))

(define (double x) (* 2 x))

(define (cubic x) (* x x x))

(provide square sum-of-squares average double cubic)
