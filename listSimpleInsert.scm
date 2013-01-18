(DEFINE 
	(listSimpleInsert an_int to_list)
		; 插入整數至單層整數升序 list 中符合大小順序的位置
		; 參數
		; 　an_int - 欲插入的 atom
		; 　to_list - 插進去的 list
		; 運算結果
		; 	插入後的 list
		; 	() - 錯誤輸入
	;(DISPLAY "【除錯訊息】") (NEWLINE)
	;(DISPLAY "	an_int = ") (DISPLAY an_int) (NEWLINE)
	;(DISPLAY "	to_list = ") (DISPLAY to_list) (NEWLINE)
	(
		COND
		; 排除錯誤輸入
			(
				(IF
					(NOT (NUMBER? an_int))
					#T
					#F
				)
				(DISPLAY "錯誤：an_int 不能是非數字") (NEWLINE)
				'()
			)
			(
				(IF
					(NOT (LIST? to_list))
					#T
					#F
				)
				(DISPLAY "錯誤：to_list 不能是非 list") (NEWLINE)
				'()
			)
			
		; 收斂狀況
		(; 如果 to_list 是空的 an_int 可以直接插進去
			(NULL? to_list)
			(CONS an_int to_list)
		)
		
		; recursive condition
		(
			(> an_int (CAR to_list))
			(CONS (CAR to_list) (listSimpleInsert an_int (CDR to_list)))
		)
		(
			(<= an_int (CAR to_list))
			(CONS an_int to_list)
		)
	)
)


; testcase
(listSimpleInsert 'a '())
	; 錯誤：an_int 不能是非數字
(listSimpleInsert 1 'a)
	; 錯誤：to_list 不能是非 list
(listSimpleInsert 3 '())
	; (3)
	
	
; test case(official)
(listSimpleInsert 2 '(1 5 7))  
; (1 2 5 7)

(listSimpleInsert 9 '(1 5 7))  
; (1 5 7 9)

(listSimpleInsert 1 '(3 5 7))  
; (1 3 5 7)