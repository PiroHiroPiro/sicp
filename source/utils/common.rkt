#lang racket

(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (average x y) (/ (+ x y) 2))

(define (double x) (* 2 x))

(define (cube x) (* x x x))

(define (even n) (= (remainder n 2) 0))

(define (halve n) (/ n 2))

(provide square sum-of-squares average double cube even halve)
