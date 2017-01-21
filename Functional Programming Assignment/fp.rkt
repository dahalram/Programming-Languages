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
              (IF (NUMBER? L) L 0)
              (ELSE (+ (CAR L) (CDR L)))

         )


)

(DEFINE (sum-up-numbers-general L)



)

(DEFINE (min-above-min L1 L2)



)