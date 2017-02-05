;;Ram Hari Dahal

;;;;;;;;;;; 1. 
; Reverse a general list
(DEFINE (reverse-helper L)
        (IF (NULL? L)
           L
           (APPEND (reverse-helper (CDR L)) (LIST (CAR L)))
        )
)

; Do a recursion on the general list
(DEFINE (reverse-general L)
        (MAP (LAMBDA (A)
                     (IF (LIST? A)
                         (reverse-general A) A))
             (reverse-helper L))
)


;;;;;;;;; 2.
; Sum of only the numbers, not the nested lists
(DEFINE (sum-up-numbers-simple L)
        (COND ((NULL? L) 0)
              ((NUMBER? L) L 0)
              ((NOT (NUMBER? (CAR L))) (sum-up-numbers-simple (CDR L)))
              (ELSE (+  (CAR L) (sum-up-numbers-simple (CDR L)))) 
         )
)


;;;;;;;;; 3.
; Sum of all the numbers including in the nested list
(DEFINE (sum-up-numbers-general L)
        (COND ((NULL? L) 0)
              ;((NUMBER? L) L 0)
              ;((NOT (LIST? L) )
              ((LIST? (CAR L)) (+ (sum-up-numbers-general (CAR L)) (sum-up-numbers-general (CDR L))))
              ((NUMBER? (CAR L)) (+ (CAR L) (sum-up-numbers-general (CDR L))))
              (ELSE (sum-up-numbers-general (CDR L)))
         )              
)


;;;;;;;;;4.
; Find the value in list1 that is greater than the min value in list2
(DEFINE (min-val L)
        (COND ;((NUMBER? (CAR L)) )
              ((NULL? L) #f)
              ;((NULL? (CDR L)) (CAR L)) ;(NUMBER? (CAR L) (CAR L)))
              ((NUMBER? (CAR L))
               (IF (NUMBER? (min-val (CDR L)))
                   (IF (< (CAR L) (min-val (CDR L))) (CAR L)
                       (min-val (CDR L)))
               (CAR L)))
              (ELSE (min-val (CDR L)))
         )
)

(DEFINE (get-larger-nums L1 L2)
        (COND ((NULL? L1) '())
              ((COND ((NUMBER? (CAR L1)) (> (CAR L1) (COND ((EQ? (min-val L2) #F) 0)
                                                           (ELSE (min-val L2)) ) ))
                                                           (ELSE #F))
               (CONS (CAR L1)
                     (get-larger-nums (CDR L1) L2)))
              (ELSE (get-larger-nums (CDR L1) L2))

         )
)

(DEFINE (min-above-min L1 L2)
       (COND
        
        ((EQ? (min-val (get-larger-nums L1 L2)) #F) #F)
        ((EQ? (min-val (get-larger-nums L1 L2)) '()) #F)
        (ELSE (min-val (get-larger-nums L1 L2)))
     
       )
)

(min-val '(a 2 b 3))