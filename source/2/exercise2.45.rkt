#lang racket

(define (split painter1 painter2)
  (lambda (image) (painter1 image (painter2 image)))
)
