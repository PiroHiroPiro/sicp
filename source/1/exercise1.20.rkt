#lang racket

(require "../utils/common.rkt")

(require racket/trace)

(define (gcd a b)
  (trace-define (trace-remainder n m) (remainder n m))
  (if (= b 0)
    a
    (gcd b (trace-remainder a b))
  )
)

; 4
(gcd 206 40)
