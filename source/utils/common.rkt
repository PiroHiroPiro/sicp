#lang racket

(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (average x y) (/ (+ x y) 2))

(define (double x) (* 2 x))

(define (cube x) (* x x x))

(define (even? n) (= (remainder n 2) 0))

(define (halve n) (/ n 2))

(define (inc x) (+ x 1))

(define (expt b n)
  (define (fastest-expt-iter b n a)
    (cond
      ((= n 0) a)
      ((even? n) (fastest-expt-iter (square b) (halve n) a))
      (else (fastest-expt-iter b (- n 1) (* a b)))
    )
  )
  (fastest-expt-iter b n 1)
)

(define (gcd a b)
  (trace-define (trace-remainder n m) (remainder n m))
  (if (= b 0)
    a
    (gcd b (trace-remainder a b))
  )
)

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

(provide square sum-of-squares average double cube even? halve inc expt gcd prime? sum repeated)
