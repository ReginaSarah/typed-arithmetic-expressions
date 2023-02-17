#lang racket

(require redex)
(require rackcheck)
(provide (all-defined-out))

(define-language Arithmetic
  (t v
     ('if' t 'then' t 'else' t)
     (pred t)
     (iszero t)
     (succ t)
     )
  (v true
     false
     nv)
  (nv natural
      )
  (c ('if' t 'then' t 'else' c)
     (pred c)
     (iszero c)
     (succ c)
     hole
     )
  [T boolean
     natural] 
  )

(define-extended-language Typing Arithmetic
  
  )