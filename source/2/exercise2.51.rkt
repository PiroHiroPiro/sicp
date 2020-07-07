#lang racket

(define (below painter1 painter2)
  (let
    ((split-point (make-vect 0.0 0.5)))
    (let
      (
        (paint-down (transform-painter painter2 split-point (make-vect 1.0 0.5) (make-vect 0.0 1.0)))
        (paint-up (transform-painter painter1 (make-vect 0.0 0.0) (make-vect 1.0 0.0) split-point))
      )
      (lambda (frame)
        (paint-down frame)
        (paint-up frame)
      )
    )
  )
)

;; ref: https://www.serendip.ws/archives/848

(define (beside painter1 painter2)
  (let
    ((split-point (make-vect 0.5 0.0)))
    (let
      (
        (paint-left (transform-painter painter1 (make-vect 0.0 0.0) split-point (make-vect 0.0 1.0)))
        (paint-right (transform-painter painter2 split-point (make-vect 1.0 0.0) (make-vect 0.5 1.0)))
      )
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)
      )
    )
  )
)

(define (rotate270 painter)
  (transform-painter
    painter
    (make-vect 0.0 1.0)
    (make-vect 0.0 0.0)
    (make-vect 1.0 1.0)
  )
)

(define (rotate90 painter)
  (transform-painter
    painter
    (make-vect 1.0 0.0)
    (make-vect 1.0 1.0)
    (make-vect 0.0 0.0)
  )
)

(define (below painter1 painter2)
  (let
    (
      (rotated270-painter1 (rotate270 painter1))
      (rotated270-painter2 (rotate270 painter2))
    )
    (let
      ((besided-frame (beside rotated270-painter1 rotated270-painter2)))
      (rotate90 besided-frame)
    )
  )
)
