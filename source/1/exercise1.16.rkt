#lang racket

(require "../utils/common.rkt")

(require racket/trace)

(define (expt b n) (expt-iter b n 1))
(trace-define (expt-iter b counter product)
  (if (= counter 0)
    product
    (expt-iter b
      (- counter 1)
      (* b product)
    )
  )
)

; 8
(expt 5 7)
; 32
(expt 13 31)

(trace-define (fast-expt b n)
  (cond
    ((= n 0) 1)
    ((even? n) (square (fast-expt b (/ n 2))))
    (else (* b (fast-expt b (- n 1))))
  )
)

; 6
(fast-expt 5 7)
; 10
(fast-expt 13 31)

(define (fastest-expt b n) (fastest-expt-iter b n 1))
(trace-define (fastest-expt-iter b n a)
  (cond
    ((= n 0) a)
    ((even? n) (fastest-expt-iter (square b) (/ n 2) a))
    (else (fastest-expt-iter b (- n 1) (* a b)))
  )
)

; 6
(fastest-expt 5 7)
; 10
(fastest-expt 13 31)
