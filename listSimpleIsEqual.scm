(DEFINE (listSimpleIsEqual list1 list2) (
	; 判定兩個單層 list 是否完全相同（包括順序）
	; 解出值
	; 　有
	; 		#T
	; 	無
	; 		()
	COND
		; 如果兩個 list 都是空的就相同
			((NULL? list1) (NULL? list2))
		; list1 不是空的，第二個是空的就互不相同
			((NULL? list2) '())
		; 兩個 list 都不是空的
			; 比兩個 list 的第一個相同的話就一起比下一個
				((EQ? (CAR list1) (CAR list2))
					(listSimpleIsEqual (CDR list1) (CDR list2)))
			; 第一個不一樣就不相同
				(ELSE '())
	)
)
		
(listSimpleIsEqual '(a b c) '(a b c))
; => #T
(listSimpleIsEqual '(a c b) '(a b c))
; => #F
(listSimpleIsEqual '() '())
; => #T
(listSimpleIsEqual '() '(C))

		