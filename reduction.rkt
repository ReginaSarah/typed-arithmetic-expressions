#lang racket

(require redex)
(require "./lang.rkt")
(provide (all-defined-out))


(define typing
  (reduction-relation 
   Arithmetic  

   (--> (in-hole c false)
        (in-hole c bool))

   (--> (in-hole c true)
        (in-hole c bool))

   (--> (in-hole c natural_1)
        (in-hole c nat))
   (--> (in-hole c (succ nat))
        (in-hole c nat))
   (--> (in-hole c (pred nat))
        (in-hole c nat))
   (--> (in-hole c (iszero nat))
        (in-hole c bool))
   (--> (in-hole c (Tif bool T_1 T_1))
        (in-hole c T_1))
   )
  )

;(traces typing (term true))
;(traces typing (term false))
;(traces typing (term 0))
;(traces typing (term (succ 4)))
;(traces typing (term (iszero 4)))
;(traces typing (term (pred 4)))

(apply-reduction-relation* typing (term (Tif false (succ 0) (pred 0))))
(apply-reduction-relation* typing (term (Tif false true false)))


(apply-reduction-relation typing (term true))
(apply-reduction-relation typing (term 0))
(apply-reduction-relation typing (term (succ (pred (succ 2)))))
(apply-reduction-relation typing (term (pred 5)))
(apply-reduction-relation typing (term (iszero 5)))
(apply-reduction-relation typing (term (iszero (pred (succ 2)))))
(traces typing (term (iszero (pred (succ 2)))))

;(traces typing (term (Tif #f 2 true)))
;(traces typing (term (succ 4)))
;(apply-reduction-relation typing (term (iszero (pred 4))))
;(apply-reduction-relation typing (term ('if' 2 'then' 2 'else' true)))
