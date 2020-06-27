#lang racket

(define (square x) (* x x))

(define (cube x) (* x x x))

(define (average x y) (/ (+ x y) 2))

(define (even? n) (= (remainder n 2) 0))

(define (odd? n) (= (remainder n 2) 1))

(define (inc x) (+ x 1))

; 1.2.6
(define (prime? n)
  (define (smallest-divisor n)
    (define (find-divisor n test-divisor)
      (define (divides? a b) (= (remainder b a) 0))
      (define (next n) (if (= n 2) 3 (+ n 2)))
      (cond
        ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))
      )
    )
    (find-divisor n 2)
  )
  (= n (smallest-divisor n))
)

; 1.3.1
(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a) (sum term (next a) next b))
  )
)

; 1.3.4 - 1.43
(define (repeated f n)
  (if (= n 1)
    (lambda (x) (f x))
    (compose f (repeated f (- n 1)))
  )
)

(define (log2 x) (/ (log x) (log 2)))

; 2.2.3
(define (enumerate-tree tree)
  (cond
    ((null? tree) null)
    ((not (pair? tree)) (list tree))
    (else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))
  )
)
(define (filter predicate sequence)
  (cond
    ((null? sequence) null)
    ((predicate (car sequence)) (cons (car sequence)(filter predicate (cdr sequence))))
    (else (filter predicate (cdr sequence)))
  )
)
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence) (accumulate op initial (cdr sequence)))
  )
)

; 2.2.3 - 2.36
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    null
    (cons (accumulate op init (map (lambda (seq) (car seq)) seqs)) (accumulate-n op init (map (lambda (seq) (cdr seq)) seqs)))
  )
)

(define (list-sum l)
  (apply + l)
)

(provide square cube average even? odd? inc prime? sum repeated log2 enumerate-tree filter accumulate accumulate-n list-sum)
