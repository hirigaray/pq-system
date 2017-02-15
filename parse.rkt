#lang racket

(provide
  valid-theorem?
  collect-start
  collect-middle
  collect-ending
  produce-theorem)

; Check if a theorem is valid
(define (valid-theorem? t)
  (equal? (+ (collect-start t)
             (collect-middle t))
          (collect-ending t)))

; Returns the numeric value of the theorem until p
(define (collect-start t)
  (let aux ((in t) (out 0))
    (if (equal? 'p (car in))
      out
      (aux (cdr in) (+ 1 out)))))

; Returns the numeric value of the middle of theorem until q
(define (collect-middle t)
  (let aux ((in t) (out 0))
    (if (equal? 'p (car in))
      (aux (cdr in) 0)
      (if (equal? 'q (car in))
        out
        (aux (cdr in) (+ 1 out))))))

; Returns the numeric value of the ending part of the theorem
(define (collect-ending t)
  (let aux ((in t) (out 0))
     (if (null? in)
       out
       (if (equal? 'q (car in))
         (aux (cdr in) 0)
         (aux (cdr in) (+ 1 out))))))

; Produces a valid theorem
(define (produce-theorem x y)
  (letrec
    ((produce-lines
       (lambda (in out)
         (if (zero? in)
           out
           (produce-lines (- in 1) (cons '- out))))))
    (flatten
      (list (produce-lines x '())
            'p
            (produce-lines y '())
            'q
            (produce-lines x '())
            (produce-lines y '())))))

