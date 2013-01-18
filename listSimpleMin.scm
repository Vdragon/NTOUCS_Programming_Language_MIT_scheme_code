(DEFINE (listSimpleMin a_list) (
	; 找出單層、只有數字的 list 的最小數值子程式
	; 	參數
	; 		一個 list
	; 	解出值
	; 		list 的最小數值
	; 		NIL - list 包含非數值
		COND
		; 錯誤輸入排除
			; a_list 只能是 list
				((NOT (LIST? a_list)) 'NIL)
			; a_list 不能是空的 list
				((NULL? a_list) 'NIL)
			; a_list 的 CAR 只能是數字
				((NOT (NUMBER? (CAR a_list))) 'NIL)
				
		; 收斂狀況
			; 如果 a_list 只有一個數字，該數字即為 a_list 的最小值
				((NULL? (CDR a_list)) (CAR a_list))
		
		; recursive case
			; 如果 a_list 不只一個項目，則 a_list 的最小值為 a_list 的 CAR 與 listMin(CDR) 的較小值
			(ELSE 
				(LET (
						(cdrMin (listSimpleMin (CDR a_list)))
					)
					(IF 
						(EQ? cdrMin 'NIL) 'NIL
						(MIN (CAR a_list) cdrMin)
					)
				)
			)
			
	)
)

; test case
	(listSimpleMin 'a)
		; Nil
	(listSimpleMin '())
		; Nil
	(listSimpleMin '(a))
		; Nil
	(listSimpleMin '(3))
		; 3
	(listSimpleMin '(1 2))
		; 1
	(listSimpleMin '(2 1))
		; 1
	(listSimpleMin '(1 2 3 2 1))
		; 1
	(listSimpleMin '(1 (2) 3 2 1))