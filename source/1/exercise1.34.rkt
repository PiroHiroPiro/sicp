#lang racket

(define (f g) (g 2))
; (f square) ; 4
; (f (lambda (z) (* z (+ z 1)))) ; 6
(f f) ; (f f) -> (f 2) -> (2 2) => 演算できないエラー
