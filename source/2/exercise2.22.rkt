#lang racket

(require "../utils/common.rkt")

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter
        (cdr things)
        ; (cons (square (car things)) answer)
        (cons answer (square (car things)))
      )
    )
  )
  (iter items null)
)

(square-list (list 1 2 3 4))


; (list 1 2 3 4) = (cons 1 (cons 2 (cons 3 (cons 4 null))))

; ;(cons (square (car things)) answer)
; (iter (list 1 2 3 4) null)
; (iter (list 2 3 4) (cons 1 null))
; (iter (list 3 4) (cons 4 (cons 1 null)))
; (iter (list 4) (cons 9 (cons 4 (cons 1 null))))
; (iter null (cons 16 (cons 9 (cons 4 (cons 1 null)))))
; =>
; (list 16 9 4 1) = (cons 16 (cons 9 (cons 4 (cons 1 null))))

; ;(cons answer (square (car things)))
; (iter (list 1 2 3 4) null)
; (iter (cdr (list 2 3 4)) (cons null 1))
; (iter (cdr (list 3 4)) (cons (cons null 1) 4))
; (iter (cdr (list 4)) (cons (cons (cons null 1) 4) 9))
; (iter (cdr null) (cons (cons (cons (cons null 1) 4) 9) 16))
; =>
; (list 1 4 9 16) != (cons (cons (cons (cons null 1) 4) 9) 16)
