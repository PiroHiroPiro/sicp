#lang racket

(require "../utils/common.rkt")

(define (adjoin-position row col rest-of-queens)
  (cons (cons row col) rest-of-queens)
)

(define empty-board '())

(define (conflict-pairs? s t)
  (let
    (
      (dx (abs (- (car s) (car t))))
      (dy (abs (- (cdr s) (cdr t))))
    )
    (cond
      ((= dx 0) #t)
      ((= dy 0) #t)
      ((= dx dy) #t)
      (else #f)
    )
  )
)

(define (safe? col positions)
  ; (and (display positions) (newline))
  (define (safe-iter rest-positions)
    (cond
      ((null? rest-positions) #t)
      ((conflict-pairs? (car positions) (car rest-positions)) #f)
      (else (safe-iter (cdr rest-positions)))
    )
  )
  (safe-iter (cdr positions))
)

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list empty-board)
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map
              (lambda (new-row) (adjoin-position new-row k rest-of-queens))
              (enumerate-interval 1 board-size)
            )
          )
          (queen-cols (- k 1))
        )
      )
    )
  )
  (queen-cols board-size)
)

(queens 8)
