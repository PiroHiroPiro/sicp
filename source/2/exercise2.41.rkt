#lang racket

(require "../utils/common.rkt")

(define (flatmap proc seq)
  (accumulate append null (map proc seq))
)

(define (enumerate-interval low high)
  (if (> low high)
    null
    (cons low (enumerate-interval (+ low 1) high))
  )
)

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
