#lang racket

(define elem1 car)
(define elem2 caddr)

(define (pochodna expr x)
  (cond
    ((number? expr) 0)
    ((symbol? expr)
     (if (eq? expr x)
         1
         0))
    ((suma? expr)
     (dodaj (pochodna (elem1 expr) x)
            (pochodna (elem2 expr) x)))

    ((roznica? expr)
     (odejmij (pochodna (elem1 expr) x)
               (pochodna (elem2 expr) x)))

    ((iloczyn? expr)
     (dodaj (pomnoz (pochodna (elem1 expr) x) (elem2 expr))
             (pomnoz (elem1 expr) (pochodna (elem2 expr) x))))
    ((iloraz? expr)
     (podziel (odejmij (pomnoz (pochodna (elem1 expr) x) (elem2 expr))
                       (pomnoz (elem1 expr) (pochodna (elem2 expr) x)))
              (pomnoz (elem2 expr) (elem2 expr))))))
     
(define (suma? expr)
  (and (pair? expr) (eq? (cadr expr) '+)))

(define (dodaj x y)
   (list x '+ y))

(define (roznica? expr)
  (and (pair? expr) (eq? (cadr expr) '-)))

(define (odejmij x y)
  (list x '- y))

(define (iloczyn? expr)
  (and (pair? expr) (eq? (cadr expr) '*)))

(define (pomnoz x y)
   (list x '* y))

(define (iloraz? expr)
   (and (pair? expr) (eq? (cadr expr) '/)))

(define (podziel x y)
  (cond ((eq? x 0) 0)
        ((eq? y 0) 0)
        (else (list x '/ y))))