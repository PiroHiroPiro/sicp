#lang racket

(require "../utils/common.rkt")

; (define (* a b)
;   (if (= b 0)
;     0
;     (+ a (* a (- b 1)))
;   )
; )

(define (* a b)
  (cond
    ((or (= a 0) (= b 0)) 0)
    ((= b 1) a)
    ((even b) (* (double a) (halve b)))
    (else (+ a (* a (- b 1))))
  )
)

(* 3 5)  ; 15
(* 7 8)  ; 56
(* 5 0)  ; 0
