#lang racket

(define x (list (list 1 2) (list 3 4)))

(define (fringe l)
  ; (and (display l) (newline))
  (cond
    ((null? l) null)  ; '() -> '()
    ((not (pair? l)) (list l))  ; 1 -> '(1)
    ((pair? l) (append (fringe (car l)) (fringe (cdr l)) ))  ; '(1 2) -> (append '(1) '(2))
    (else l)  ; '(2) -> '(2)
  )
)

(fringe x)
(fringe (list x x))
