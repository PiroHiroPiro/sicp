#lang racket

(define (inc x) (+ x 1))

(define (double f)
  (lambda (x) (f (f x)))
)

(((double (double double)) inc) 5) ; 13
; (double) -> (lambda (x) (f (f x)))
; (double double) -> (lambda (x) (f (f (f (f x)))))
; (double (double double)) -> (lambda (x) (f (f (f (f (f (f (f (f x)))))))))
; ((double (double double)) inc) -> (lambda (x) (inc (inc (inc (inc (inc (inc (inc (inc x)))))))))
; (((double (double double)) inc) 5) -> 13 ?????????????????????
;
; (((double (double double)) inc) 5)
; (((double double) (double double)) inc) 5)
; ((double double double double inc) 5)
; ((double double double inc inc) 5)
; ((double double inc inc inc inc) 5)
; ((double inc inc inc inc inc inc inc inc) 5)
; ((inc inc inc inc inc inc inc inc inc inc inc inc inc inc inc inc) 5)
; (inc inc inc inc inc inc inc inc inc inc inc inc inc inc inc inc 5)
; (21)
