#lang racket

(require "../utils/common.rkt")

(define (fib n) (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond
    (
      (= count 0)
      b
    )
    (
      (even? count)
      (fib-iter
        a
        b
        (+ (square p) (square q)) ; ⟨??⟩ ; p’ を計算する
        (+ (* 2 p q)) (square q)) ; ⟨??⟩ ; q’ を計算する
        (/ count 2)
      )
    )
    (else
      (fib-iter
        (+ (* b q) (* a q) (* a p))
        (+ (* b p) (* a q))
        p
        q
        (- count 1)
      )
    )
  )
)

(fib 1) ; 1
(fib 2) ; 1
(fib 3) ; 2
(fib 4) ; 3
(fib 5) ; 5
(fib 6) ; 8
(fib 7) ; 13
(fib 8) ; 21
