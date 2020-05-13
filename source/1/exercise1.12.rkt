#lang racket

(require "../utils/common.rkt")

(define
  (pascals-triangle l n)
  (cond
    ((or (< l 1) (< l n) (< n 1)) 0)
    ((and (= l 1) (= n 1)) 1)
    (else (+ (pascals-triangle (- l 1) (- n 1)) (pascals-triangle (- l 1) n)))
  )
)

(pascals-triangle 1 1) ; 1
(pascals-triangle 2 1) ; 1
(pascals-triangle 2 2) ; 1
(pascals-triangle 3 2) ; 2
(pascals-triangle 4 3) ; 3
(pascals-triangle 5 1) ; 1
(pascals-triangle 5 2) ; 4
(pascals-triangle 5 3) ; 6
