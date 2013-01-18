;isEqual.scm

(DEFINE (isEqual list1 list2)(
	; 判斷兩清單是否相同
	; 參數
	; 解出值
	;   
	COND
		; 基本狀況
			; 不是 list？
				; 如果第一個不是 list 的話就用 EQ? 比對是否為相同 atom
					((NOT (LIST? list1)) (EQ? list1 list2))
				; 如果第一個是 list 第二個不是就不相同
					((NOT (LIST? list2)) '())
			; 是空的？
				; 如果兩個都是空的 list 就相同
					((NULL? list1) (NULL? list2))
				; 如果只有 list2 是空的就不相同
					((NULL? list2) '())
		; 比第一個相同的話就比剩下的
			((isEqual (CAR list1) (CAR list2))
				(isEqual (CDR list1) (CDR list2)))
		; 剩餘情況就是不相同
		(ELSE '())
	)
)
		
		
; testcase
(isEqual '((a b c) a b c) '((a b c) a b c)) 
; ==> #T
(isEqual '(a b c) '(a b c)) 
; ==> #T
(isEqual 'a 'a)
; ==> #T
; why?

(isEqual '((a b) a b c) '((b c) a b c)) 
; ==> ()

