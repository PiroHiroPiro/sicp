#lang racket

;; 列の演算

(define (enumerate-tree tree)
  (cond
    ((null? tree) null)
    ((not (pair? tree)) (list tree))
    (else (append (enumerate-tree (car tree)) (enumerate-tree (cdr tree))))
  )
)

(enumerate-tree (list 1 (list 2 (list 3 4)) 5))

(define (filter predicate sequence)
  (cond
    ((null? sequence) null)
    ((predicate (car sequence)) (cons (car sequence)(filter predicate (cdr sequence))))
    (else (filter predicate (cdr sequence)))
  )
)

(filter odd? (list 1 2 3 4 5))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence) (accumulate op initial (cdr sequence)))
  )
)

(accumulate + 0 (list 1 2 3 4 5))
(accumulate * 1 (list 1 2 3 4 5))
(accumulate cons null (list 1 2 3 4 5))


;; マップのネスト

(require "../utils/common.rkt")

(define (flatmap proc seq)
  (accumulate append null (map proc seq))
)

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair)))
)

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair)))
)

(define (enumerate-interval low high)
  (if (> low high)
    null
    (cons low (enumerate-interval (+ low 1) high))
  )
)

(define (prime-sum-pairs n)
  (map make-pair-sum
    (filter
      prime-sum?
      (flatmap
        (lambda (i)
          (map
            (lambda (j) (list i j))
            (enumerate-interval 1 (- i 1))
          )
        )
        (enumerate-interval 1 n)
      )
    )
  )
)

(prime-sum-pairs 6)

(define (permutations s)
  (if (null? s) ; 集合は空か?
    (list null) ; 空集合を持つ列
    (flatmap
      (lambda (x)
        (map (lambda (p) (cons x p)) (permutations (remove x s)))
      )
    s)
  )
)

(permutations (list 1 2 3))

(define (remove item sequence)
  (filter (lambda (x) (not (= x item))) sequence)
)

(remove 3 (list 1 2 3 4 3 2 1))
