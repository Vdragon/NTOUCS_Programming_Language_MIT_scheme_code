;listSum.scm
(DEFINE (listSum a_list) (
		COND
			((NULL? a_list) 0)
			(ELSE (EVAL (CONS '+ a_list) user-initial-environment))
	)
)
'(CONS '+ a_list)


;testcase
(listSum '())
(listSum '(3))
(listSum '(3 5))
(listSum '(3 5 7))