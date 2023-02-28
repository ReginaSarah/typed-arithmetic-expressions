#lang racket

(require redex)
(require "./lang.rkt")
(provide (all-defined-out))


(define typing
  (reduction-relation 
   Typing  

   (--> (in-hole c false)
        (in-hole c boolean))

   (--> (in-hole c true)
        (in-hole c boolean))

   (--> (in-hole c natural_1)
        (in-hole c natural))

   (--> (succ (in-hole c natural_1))
        natural)
   
   (--> (pred (in-hole c natural_1))
        natural)

   (--> (iszero (in-hole c natural_1))
        boolean)

   (--> (Tif (in-hole c boolean) c c)
        natural)
   )
  )

;(traces typing (term true))
;(traces typing (term false))
;(traces typing (term 0))
;(traces typing (term (succ 4)))
;(traces typing (term (iszero 4)))
;(traces typing (term (pred 4)))
;(traces typing (term (Tif #f 2 true)))

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
