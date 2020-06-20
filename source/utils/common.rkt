#lang racket

(define (square x) (* x x))

(define (cube x) (* x x x))

(define (average x y) (/ (+ x y) 2))

(define (even? n) (= (remainder n 2) 0))

(define (odd? n) (= (remainder n 2) 1))

(define (inc x) (+ x 1))

(define (prime? n)
  (define (smallest-divisor n)
    (define (find-divisor n test-divisor)
      (define (divides? a b) (= (remainder b a) 0))
      (define (next n) (if (= n 2) 3 (+ n 2)))
      (cond
        ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))
      )
    )
    (find-divisor n 2)
  )
  (= n (smallest-divisor n))
)

(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a) (sum term (next a) next b))
  )
)

(define (repeated f n)
  (if (= n 1)
    (lambda (x) (f x))
    (compose f (repeated f (- n 1)))
  )
)

(define (log2 x)
  (/
    (log x)
    (log 2)
  )
)

(provide square cube average even? odd? inc prime? sum repeated log2)
