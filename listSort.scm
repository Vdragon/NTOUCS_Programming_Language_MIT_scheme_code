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


(DEFINE 
	(listSort a_list)
	; function sort for list
	; parameter
	; 	a_list - a simple, or first nested, list to sort
	; evaluate to
	; 	sorted list
	; 	() if input is not a list
	;(DISPLAY "除錯訊息")(NEWLINE)
	;(DISPLAY "　a_list = ")(DISPLAY a_list)(NEWLINE)
	(
		COND
		; 排除錯誤輸入
		(
			(NOT (LIST? a_list))
			(DISPLAY "錯誤：a_list 必須是 list") (NEWLINE)
			'()
		)
		
		(
			(NULL? a_list)
			(DISPLAY "警告：a_list 必須有數值才能排序") (NEWLINE)
			'()
		)			
		
		; 收斂狀況
		(; 如果 a_list 只有非 list 數值就不用排序
			(AND (NULL? (CDR a_list)) (NOT (LIST? (CDR a_list))))
			a_list
		)	
		
		; recursive case
		(
			; a_list 的第一個數值是 list 的話就排序其內數值然後與後者合併
			(LIST? (CAR a_list))
			(CONS (listSort (CAR a_list)) (listSort (CDR a_list)))
			;
		)
		(ELSE
			; a_list 有多個數值就持續將 CAR 插入到排序後的 CDR 
			(listSimpleInsert  (CAR a_list) (listSort (CDR a_list)))
		)
	)
)

;testcase
;(listSort 'a)
; 錯誤：a_list 必須是 list
;(listSort '())
; 錯誤：a_list 必須有數值才能排序
;(listSort '(8))
;Value 25: (8)
;(listSort '(8 16))
;Value 27: (8 16)
;(listSort '(16 8))
;Value 27: (8 16)
;(listSort '((16 4) 8))

; official testcase
(listSort '(3 1 5 7)) 
; (1 3 5 7)

(listSort '(3 1 9 5 7 0))  
;(0 1 3 5 7 9)

;(hint:  list 放前面)
(listSort '(((3 1) 9 5) 7 0))  
;(((1 3) 5 9) 0 7))  
