#lang racket

(require "../utils/common.rkt")

(define (f-saiki n)
  (if (< n 3)
    n
    (+ (f-saiki (- n 1)) (* 2 (f-saiki (- n 2))) (* 3 (f-saiki (- n 3))))
  )
)

(f-saiki 0)
(f-saiki 1)
(f-saiki 2)
(f-saiki 3)
(f-saiki 4)
(f-saiki 5)

(define (f-hanpuku n)
  (define (f-iter a b c count) (if (= count 0) c (f-iter b c (+ (* 3 a) (* 2 b) c) (- count 1))))
  (if (< n 3)
    n
    (f-iter 0 1 2 (- n 2))
  )
)

(f-hanpuku 0)
(f-hanpuku 1)
(f-hanpuku 2)
(f-hanpuku 3)
(f-hanpuku 4)
(f-hanpuku 5)
