#lang racket

(define (equal? l1 l2)
  (cond
    ((not (= (length l1) (length l2))) #f)
    ((and (eq? '() l1) (eq? '() l2)) #t)
    ((eq? (car l1) (car l2)) (equal? (cdr l1) (cdr l2)))
    (else #f)
  )
)

(equal? '(this is a list) '(this is a list))
; -> #t

(equal? '(this is a list) '(this is a map))
; -> #f

(equal? '(this is a list) '(this (is a) list))
; -> #f
