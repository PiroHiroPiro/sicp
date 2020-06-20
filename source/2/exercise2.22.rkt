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
  (iter items nil)
)

(square-list (list 1 2 3 4))


; (list 1 2 3 4) = (cons 1 (cons 2 (cons 3 (cons 4 nil))))

; ;(cons (square (car things)) answer)
; (iter (list 1 2 3 4) nil)
; (iter (list 2 3 4) (cons 1 nil))
; (iter (list 3 4) (cons 4 (cons 1 nil)))
; (iter (list 4) (cons 9 (cons 4 (cons 1 nil))))
; (iter nil (cons 16 (cons 9 (cons 4 (cons 1 nil)))))
; =>
; (list 16 9 4 1) = (cons 16 (cons 9 (cons 4 (cons 1 nil))))

; ;(cons answer (square (car things)))
; (iter (list 1 2 3 4) nil)
; (iter (cdr (list 2 3 4)) (cons nil 1))
; (iter (cdr (list 3 4)) (cons (cons nil 1) 4))
; (iter (cdr (list 4)) (cons (cons (cons nil 1) 4) 9))
; (iter (cdr nil) (cons (cons (cons (cons nil 1) 4) 9) 16))
; =>
; (list 1 4 9 16) != (cons (cons (cons (cons nil 1) 4) 9) 16)
