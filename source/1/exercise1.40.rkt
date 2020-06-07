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

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx))
)

(define dx 0.00001)

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x))))
)
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess)
)

(define (cubic a b c)
  (lambda (x)
    (+
      (cube x)
      (* a x x)
      (* b x)
      c
    )
  )
)

(newtons-method (cubic 2 3 4) 1.0) ; -1.6506291914330982
