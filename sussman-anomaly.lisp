; sussman anomaly for no solutions by strips --cem bozsahin

;; blocks world as in Ghallab et al

;; should be able to run your STRIPS by typing:
;; (strips (list start-state goal-state operators))

; start state
(setf start-state
      '((ontable b)
	(ontable a)
	(on c a)
	(handempty)
	(clear b)
	(clear c)))

; goal state
(setf goal-state
      '((on a b)
	(on b c)))

; operators
(setf operators

      '(((unstack X Y)                    ; ACTION
	 ((on X Y) (clear X) (handempty)) ; PRECOND
	 ((holding X) (clear Y))          ; ADD
	 ((on X Y) (clear X) (handempty))) ; DELETE 
	((stack X Y)
	 ((holding X) (clear Y))
	 ((on X Y)(clear X) (handempty)))
	((pickup X)
	 ((ontable X) (clear X) (handempty))
	 ((holding X))
	 ((ontable X) (clear X) (handempty)))
	((putdown X)
	 ((holding X))
	 ((clear X) (handempty) (ontable X))
	 ((holding X)))
	)
)
