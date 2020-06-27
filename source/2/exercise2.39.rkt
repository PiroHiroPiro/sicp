#lang racket

(require "../utils/common.rkt")

(define (fold-right op initial sequence) (accumulate  op initial sequence))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest)) (cdr rest))
    )
  )
  (iter initial sequence)
)

(define (reverse sequence)
  (fold-right (lambda (x y) (append y (list x))) null sequence)
)

(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) null sequence)
)

(reverse (list 1 2 3))
