#lang racket

(provide
  collect-start
  collect-middle
  collect-ending
  produce-theorem
  valid-theorem?)

; Returns the hyphens in subsection of the theorem until p
(define (collect-start t)
  (let aux ((in t) (out '()))
    (cond
      [(null? in) '()]
      [(equal? 'p (car in)) out]
      [else (aux (cdr in) (cons '- out))])))

; Returns the hyphens in subsection of the theorem from p until q
(define (collect-middle t)
  (let aux ((in t) (out '()))
    (cond
      [(null? in) '()]
      [(equal? 'p (car in)) (aux (cdr in) '())]
      [(equal? 'q (car in)) out]
      [else (aux (cdr in) (cons '- out))])))

; Returns the hyphens in subsection of the theorem from q onwards
(define (collect-ending t)
  (let aux ((in t) (out '()))
    (cond
      [(null? in) out]
      [(equal? 'q (car in)) (aux (cdr in) '())]
      [else (aux (cdr in) (cons '- out))])))

(define (produce-lines x)
   (let aux ((in x) (out '()))
     (if (zero? in)
       out
       (aux (sub1 in) (cons '- out)))))

; Produces a valid theorem
(define (produce-theorem x y)
  (append (produce-lines x)
          (cons 'p (produce-lines y))
          (cons 'q (produce-lines x)) (produce-lines y)))

; Check if a theorem is valid
(define (valid-theorem? t)
  (equal? (append (collect-start t)
                  (collect-middle t))
          (collect-ending t)))
