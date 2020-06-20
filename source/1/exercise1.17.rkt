#lang racket

(require "../utils/common.rkt")

(require racket/trace)

; 6
; 19
; 32
; (trace-define (* a b)
;   (if (= b 0)
;     0
;     (+ a (* a (- b 1)))
;   )
; )

; 4
; 6
; 9
(trace-define (* a b)
  (cond
    ((= b 0) 0)
    ((even? b) (* (* 2 a) (/ b 2)))
    (else (+ a (* a (- b 1))))
  )
)

(* 4 0)
(* 4 1)
(* 0 4)
(* 1 4)
(* 3 5) ; 15
(* 7 18) ; 126
(* 13 31) ; 403
