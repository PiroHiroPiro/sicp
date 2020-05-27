#lang racket

(require "../utils/common.rkt")

(define (f g) (g 2))
; (f square) ; 4
; (f (lambda (z) (* z (+ z 1)))) ; 6
(f f) ; 要は後ろの関数に2が入る , f = 2 なので関数でないためエラー
; (2 2)
