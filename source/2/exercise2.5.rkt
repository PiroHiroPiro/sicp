#lang racket

(require "../utils/common.rkt")

(define (log3 x) (/ (log x) (log 3)))

(define (cons a b)
  (* (expt 2 a) (expt 3 b))
)

(define (car c)
  (define (car-iter n)
    (if (= (remainder n 3) 0)
      (car-iter (/ n 3))
      n
    )
  )
  (log2 (car-iter c))
)

(define (cdr c)
  (define (cdr-iter n)
    (if (even? n)
      (cdr-iter (halve n))
      n
    )
  )
  (/ (log (cdr-iter c)) (log 3))
)

(define s (cons 3 7))
(car s)
(cdr s)
