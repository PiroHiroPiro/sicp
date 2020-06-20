#lang racket

(require "../utils/common.rkt")

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2) (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next)
      )
    )
  )
  (try first-guess)
)

(define (average-damp f)
  (lambda (x) (average x (f x)))
)

(define (n-root-test x n c)
  (fixed-point
    ((repeated average-damp c) (lambda (y) (/ x (expt y (- n 1)))))
    1.0
  )
)

; (define k 16)
; (n-root-test (expt 2 k) k 1)
; (n-root-test (expt 2 k) k 2)
; (n-root-test (expt 2 k) k 3)
; (n-root-test (expt 2 k) k 4)

; 1 - 3 -> 1
; 4 - 7 -> 2
; 8 - 7 -> 3

(define (n-th-root x n)
  (fixed-point
    ((repeated average-damp (round (log2 n))) (lambda (y) (/ x (expt y (- n 1)))))
    1.0
  )
)

(n-th-root (expt 2 100) 100)
