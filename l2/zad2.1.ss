#lang racket

(define mymap
  (lambda (fun list)
    (cond ((null? list) '())
          (else (cons (fun (car list))
                      (mymap fun (cdr list)))))))