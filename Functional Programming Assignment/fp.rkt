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
              ((NUMBER? L) L 0)
              ((NOT (NUMBER? (CAR L))) (sum-up-numbers-simple (CDR L)))
              (ELSE (+  (CAR L) (sum-up-numbers-simple (CDR L)))) 
         )
)

(sum-up-numbers-simple '(()))
(sum-up-numbers-simple '(1 (2 3)))
(sum-up-numbers-simple '(a 100 b (200) c 300 d))

(DEFINE (sum-up-numbers-general L)
        (COND ((NULL? L) 0)
              ;((NUMBER? L) L 0)
              ;((NOT (LIST? L) )
              ((LIST? (CAR L)) (+ (sum-up-numbers-general (CAR L)) (sum-up-numbers-general (CDR L))))
              ((NUMBER? (CAR L)) (+ (CAR L) (sum-up-numbers-general (CDR L))))
              (ELSE (sum-up-numbers-general (CDR L)))
         )              
)

(sum-up-numbers-general '(a 100 b (200) c 300 d))
(sum-up-numbers-general '())
(sum-up-numbers-general '((100)))
(sum-up-numbers-general '(100 (200)))

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

(DEFINE (get-larger-nums L)



)

(DEFINE (min-above-min L1 L2)
        



)