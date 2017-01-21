;;First commit

(DEFINE (reverse-helper L)
        (IF (NULL? L)
           L
           (APPEND (reverse-helper (CDR L)) (LIST (CAR L)))
        )
)

(DEFINE (reverse-general L)
        (MAP (LAMBDA (A)
                     (IF (LIST? A)
                         (reverse-general A) A))
             (reverse-helper L))
)

(reverse-general '((a b c)) )
(reverse-general '(a b (c (d e)) f) )

(DEFINE (sum-up-numbers-simple L)
        (COND ((NULL? L) 0)
              ;;((NOT (PAIR? L))
              ((NUMBER? L) L 0)
              ((+ (CAR L) (sum-up-numbers-simple (CDR L))))
         )
)

(sum-up-numbers-simple '(1 (2 3)))

(DEFINE (sum-up-numbers-general L)
        (COND ((NULL? L) 0)
              ((NUMBER? L) L 0)
              ((+ (sum-up-numbers-general (CAR L)) (sum-up-numbers-general (CDR L))))
         )
              
)

(DEFINE (min-above-min L1 L2)



)