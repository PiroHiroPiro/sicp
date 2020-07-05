#lang racket

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
      (lambda (segment)
        (draw-line
          ((frame-coord-map frame) (start-segment segment))
          ((frame-coord-map frame) (end-segment segment))
        )
      )
      segment-list
    )
  )
)

;; ref: https://awacio.hatenadiary.org/entry/20100531/1275308856
(define (frame-painter frame)
  (segments->painter
    (list
      (make-segment (make-point 0.0 0.0) (make-point 0.0 1.0))
      (make-segment (make-point 0.0 1.0) (make-point 1.0 1.0))
      (make-segment (make-point 1.0 1.0) (make-point 1.0 0.0))
      (make-segment (make-point 1.0 0.0) (make-point 0.0 0.0))
    )
  )
)

(define (x-painter frame)
  (segments->painter
    (list
      (make-segment (make-point 0.0 0.0) (make-point 1.0 1.0))
      (make-segment (make-point 0.0 1.0) (make-point 1.0 0.0))
    )
  )
)

(define (middle-point-painter frame)
  (segments->painter
    (list
      (make-segment (make-point 0.0 0.5) (make-point 0.5 1.0))
      (make-segment (make-point 0.5 1.0) (make-point 1.0 0.5))
      (make-segment (make-point 1.0 0.5) (make-point 0.5 0.0))
      (make-segment (make-point 0.5 0.0) (make-point 0.0 0.5))
    )
  )
)

(define (wave-painter frame)
  (segments->painter
    (list
      ...
    )
  )
)
