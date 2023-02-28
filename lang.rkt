#lang racket

(require redex)
(require rackcheck)
(provide (all-defined-out))

(define-language Arithmetic
  (t true
     false
     (Tif t t t)
     0
     (succ t)
     (pred t)
     (iszero t)
     T)
  (v true
     false
     nv)
  (nv 0
      (succ nv))
  (c (Tif c t t)
     (Tif bool c t)
     (Tif bool T c)
     (pred c)
     (iszero c)
     (succ c)
     hole
     )
  [T bool
     nat] 
  )

(define-extended-language Typing Arithmetic
  
  )