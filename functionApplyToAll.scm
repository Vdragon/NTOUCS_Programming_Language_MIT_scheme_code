(DEFINE (functionApplyToAll a_function a_list) (
	; 基礎狀況
	; 	如果 a_list 為空的結果就是空的 list
		((NULL? a_list) '())
	; 取出第一個與剩下的代入函式後再合併為 list
		(ELSE (
				CONS(
					(a_function(CAR a_list))
					(functionApplyToAll a_function (CDR a_list))
				)
			)
		)
	)
)

; functionApplyToAll test case
(DEFINE (addOne x) (+ x 1))

(functionApplyToAll addOne (1 2 3 4))
