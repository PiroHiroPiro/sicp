#lang racket

(require "../utils/common.rkt")

(define (expt b n) (expt-iter b n 1))

(define (expt-iter b counter product)
  (if (= counter 0)
    product
    (expt-iter b
      (- counter 1)
      (* b product)
    )
  )
)

(expt 2 3)

(define (fast-expt b n)
  (cond
    ((= n 0) 1)
    ((even? n) (square (fast-expt b (/ n 2))))
    (else (* b (fast-expt b (- n 1))))
  )
)

(fast-expt 2 3)

(define (fastest-expt b n)
  (cond
    ((= n 0) 1)
    ((even? n) (fastest-expt (square b) (halve 2)))
    (else (* b (fastest-expt b (- n 1))))
  )
)

(fastest-expt 2 3)
