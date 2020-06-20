#lang racket

(require "../utils/common.rkt")

(define (cons a b)
  (* (expt 2 a) (expt 3 b))
)

(define (car c)
  (define (car-iter n count)
    (if (even? n)
      (car-iter (/ n 2) (+ 1 count))
      count
    )
  )
  (car-iter c 0)
)

(define (cdr c)
  (define (cdr-iter n count)
    (if (= (remainder n 3) 0)
      (cdr-iter (/ n 3) (+ 1 count))
      count
    )
  )
  (cdr-iter c 0)
)

(define s (cons 3 7))
(car s)
(cdr s)
