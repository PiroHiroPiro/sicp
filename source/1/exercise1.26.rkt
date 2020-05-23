#lang racket

(require "../utils/common.rkt")

(define (runtime) (current-inexact-milliseconds))

(define (fast-prime? n times)
  (define (fermat-test n)
    (define (try-it a)
      (define (expmod base exp m)
        (cond
          ((= exp 0) 1)
          ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m)) ; ここが違う
          (else (remainder (* base (expmod base (- exp 1) m)) m))
        )
      )
      ; (define (expmod base exp m)
      ;   (cond
      ;     ((= exp 0) 1)
      ;     ((even? exp) (remainder (* (expmod base (/ exp 2) m) (expmod base (/ exp 2) m)) m)) ; ここが違う
      ;     (else (remainder (* base (expmod base (- exp 1) m)) m))
      ;   )
      ; )
      (= (expmod a n n) a)
    )
    (try-it (+ 1 (random (- n 1))))
  )
  (cond
    ((= times 0) true)
    ((fermat-test n) (fast-prime? n (- times 1)))
    (else false)
  )
)

(define (timed-fast-prime-test n)
  (define (start-prime-test n start-time)
    (define (report-prime elapsed-time)
      (display " *** ")
      (display elapsed-time)
    )
    ; (if (prime? n)
    (when (fast-prime? n 5) ; 試行回数
      (report-prime (- (runtime) start-time))
    )
  )
  ; (newline)
  (display n)
  (start-prime-test n (runtime))
  (newline)
)

(define (search-for-fast-primes start end)
  (define (search-for-fast-primes-iter start end)
    (when (and (< start end))
      (and (timed-fast-prime-test start) (search-for-fast-primes-iter (+ start 2) end))
    )
  )
  (search-for-fast-primes-iter (+ start (if (even start) 1 0)) end)
)

(search-for-fast-primes 1000 1100)
(search-for-fast-primes 1000000 1000100)
