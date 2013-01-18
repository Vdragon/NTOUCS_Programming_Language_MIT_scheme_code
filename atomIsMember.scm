(DEFINE (atomIsMember an_atom a_list)(
	; 測試元素 an_atom 是否於 a_list 清單中
	; 解出值
	; 　有
	; 		#T
	; 	無
	; 		()
	COND
		; 基礎狀況：a_list 無元素
		((NULL? a_list) '())
		; 比較第一個
		((EQ? an_atom (CAR a_list)) #T)
		; 遞迴比較剩下的
		(ELSE (atomIsMember an_atom (CDR a_list)))
	)
)

;unit test
(atomIsMember 'a '())
;==> ()
(atomIsMember 'b '(a b c))
; ==>
(atomIsMember 'a '(a b c))
(atomIsMember 'B '(A B C))

; 錯誤輸入
(atomIsMember 'b '((a b) c))
