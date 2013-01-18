(DEFINE (listMin a_list) 
	; input value
	; 	a_list
	; 		a (probably nested) list
	; evaluate value
	; 	least numeric value in the a_list
	; 	NIL if a_list is not a list or contains nonnumeric value
	;(DISPLAY "【除錯訊息】a_list = ") (DISPLAY a_list) (NEWLINE)
	(COND
		; 排除錯誤輸入狀況
			; 如果不是 list 的話就解出 NIL
				(
					(NOT (LIST? a_list)) 
					(DISPLAY "錯誤：a_list 不是 list。") (NEWLINE)
					'NIL
				)
			; 如果是空的 list 的話就解出 NIL
				(
					(NULL? a_list) 
					(DISPLAY "錯誤：a_list 不能是空的 list。") (NEWLINE)
					'NIL
				)
			; list 的第一個項目只能是 list 或是數字
				(
					(LET (
							(first_one (CAR a_list))
						)
						(IF (NOT (LIST? first_one)) 
							(IF (NOT (NUMBER? first_one)) 
								#T 
								#F
							)
							#F
						)
					)
					(DISPLAY "錯誤：a_list 的第一個項目只能是 list 或是數字") (NEWLINE)
					'NIL
				)
				
		; 基礎／收斂狀況
			; 如果 list 只有 1 個數字的話最小值就是該數字
				(
					(IF 
						(NULL? (CDR a_list))
						(IF 
							(NUMBER? (CAR a_list)) 
							#T 
							#F
						)
						#F
					)
					(CAR a_list)
				)
			
		; recursive 狀況
			; 如果 list 中只有一個 sub list 最小值為該 list 呼叫 listMin
				(
					(IF 
						(NULL? (CDR a_list))
						#T
						#F
					)
					(LET (
							(sublist_result (listMin (CAR a_list)))
						)
						(IF 
							(EQ? sublist_result 'NIL)
							'NIL
							sublist_result
						)
					)
				)
			; 如果 list 有一個以上的項目的話最小值
				(ELSE
					; CDR 部份的結果比較少，先處理之
					(LET (
							(cdr_result (listMin (CDR a_list)))
						)
						(COND
							; 如果 cdr 的呼叫結果是 Nil 就解得 Nil
							((EQ? cdr_result 'NIL) 'NIL)
							(
							; 如果 car 是 list 的話
								(IF 
									(LIST? (CAR a_list))
									(LET (
											(car_result (listMin (CAR a_list)))
										)
										(IF 
											(EQ? car_result 'NIL)
											'NIL
											; 最小值為 car 跟 cdr 皆呼叫 listMin 的最小值
											(MIN car_result cdr_result)
										)
									)
									; 最小值為 car 跟 cdr 呼叫 listMin 的最小值
									(MIN (CAR	a_list) cdr_result)
								)
							)
						)
					)
				)
	)
)

;test case
;(listMin 'a)
	; should 'NIL
;(listMin '())
	; should 'NIL
;(listMin '(1))
	; should 1
;(listMin '(1 2))
	; should 1
;(listMin '(2 1))
	; should 1
;(listMin '(()))


;1. function min for Nested list
(listMin '(1 (2 (3 4))))
;1

;(min ‘(((4 2) 1) 3)
(listMin '(((4 2) 1) 3))
;1

;(min ‘(((1 2) 3) work)
(listMin '(((1 2) 3) work))
;NIL


