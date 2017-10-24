#lang racket

(define (splot . args)
  (cond
    ;no elem
    ((null? args) '())
    ;one elem
    ((null? (cdr args)) (map list (car args)))
    ;more elems
    (else (polacz (map
                   (lambda (x) (map (lambda (y) (cons x y))
                                    (apply splot (cdr args)))) (car args))))))

(define (polacz lists)
  (cond
    ((null? lists) '())
    (else (append (car lists) (polacz (cdr lists))))))