#lang racket

(define (split painter1 painter2)
  (lambda (image n)
    (if (= n 0)
      image
      (let
        ((smaller ((split painter1 painter2) image (- n 1))))
        (painter1 image (painter2 smaller smaller))
      )
    )
  )
)
