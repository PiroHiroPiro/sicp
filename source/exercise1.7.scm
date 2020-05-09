(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))

(define (sqrt x)
  (define (good-enough? after before x) (< (abs (- 1.0 (/ before after))) 0.001))
  (define (improve after x) (average after (/ x after)))
  (define (sqrt-iter after before x) (if (good-enough? after before x) after (sqrt-iter (improve after x) after x)))
  (sqrt-iter (improve 1.0 x) 1.0 x)
)

(sqrt 1.0E-6)
(sqrt 1.0E29)
