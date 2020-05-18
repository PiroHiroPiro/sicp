#lang racket

(require "../utils/common.rkt")

(define (smallest-divisor n) (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond
    ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (+ test-divisor 1)))
  )
)

(define (divides? a b) (= (remainder b a) 0))

(define (prime? n) (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime))
)

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime (- (runtime) start-time))
  )
)

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
)

(define (search-for-primes n) (search-for-primes-iter n 3))

(define (search-for-primes-iter n count)
  (if (< count 1)
    0
    (search-for-primes-iter (+ n 1) (- count 1))
  )
)
