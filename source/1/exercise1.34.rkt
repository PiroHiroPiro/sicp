#lang racket

(require "../utils/common.rkt")

(define (f g) (g 2))
; (f square) ; 4
; (f (lambda (z) (* z (+ z 1)))) ; 6
(f f) ; 引数の入力がないってエラー