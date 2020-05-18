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
    ((or (= a 0) (= b 0)) 0)
    ((= b 1) a)
    ((even b) (double (* a (halve b))))
    (else (+ a (* a (- b 1))))
  )
)

(* 3 5) ; 15
(* 7 18) ; 126
(* 13 31) ; 403
