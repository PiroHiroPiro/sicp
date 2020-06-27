#lang racket

(require "../utils/common.rkt")

(define (unique-triples n)
  (flatmap
    (lambda (i)
      (flatmap
        (lambda (j)
          (map (lambda (k) (list i j k)) (enumerate-interval 1 (- j 1)))
        )
        (enumerate-interval 1 (- i 1))
      )
    )
    (enumerate-interval 1 n)
  )
)

(define (sum-triples n s)
  (filter
    (lambda (triples) (= s (list-sum triples)))
    (unique-triples n)
  )
)

(sum-triples 10 8)
