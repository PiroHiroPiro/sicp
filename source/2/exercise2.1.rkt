#lang racket

(require "../utils/common.rkt")

(define (add-rat x y)
  (make-rat
    (+
      (* (numer x) (denom y))
      (* (numer y) (denom x))
    )
    (* (denom x) (denom y))
  )
)
(define (sub-rat x y)
  (make-rat
    (-
      (* (numer x) (denom y))
      (* (numer y) (denom x))
    )
    (* (denom x) (denom y))
  )
)
(define (mul-rat x y)
  (make-rat
    (* (numer x) (numer y))
    (* (denom x) (denom y))
  )
)
(define (div-rat x y)
  (make-rat
    (* (numer x) (denom y))
    (* (denom x) (numer y))
  )
)
(define (equal-rat? x y)
  (=
    (* (numer x) (denom y))
    (* (numer y) (denom x))
  )
)

; (define make-rat cons)
; (define (make-rat n d) (cons n d))
; (define (make-rat n d)
;   (let
;     ((g (gcd n d)))
;     (cons (/ n g) (/ d g))
;   )
; )
; (define (make-rat n d)
;   (define r (lambda (x) (* x -1)))
;   (let
;     ((g (gcd n d)))
;     (if (> (/ d g) 0)
;       (cons (/ n g) (/ d g))
;       (cons (r (/ n g)) (r (/ d g)))
;     )
;   )
; )
(define (make-rat n d)
  (define r (lambda (x) (* x -1)))
  (let
    ((g (gcd n d)))
    (let
      (
        (num (/ n g))
        (den (/ d g))
      )
      (if (> den 0)
        (cons num den)
        (cons (r num) (r den))
      )
    )
  )
)
; (define numer car)
(define (numer x) (car x))
; (define denom cdr)
(define (denom x) (cdr x))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline)
)

(print-rat (make-rat -6 -9))
(print-rat (make-rat -6 9))
(print-rat (make-rat 6 -9))
(gcd -6 9)
(gcd 6 -9)

(print-rat (make-rat -9 -6))
(print-rat (make-rat -9 6))
(print-rat (make-rat 9 -6))
(gcd -9 6)
(gcd 9 -6)
