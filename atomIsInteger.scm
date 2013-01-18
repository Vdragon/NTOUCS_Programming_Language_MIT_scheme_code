
(DEFINE (atomIsInteger an_atom) (
	; 判斷 atom 是否為整數
	; 解出值
	; 	#T
	; 	#F
	; 	'nil
		COND (
			; 錯誤輸入
				; 不能是 list
					((LIST? an_atom) 'nil)
				; 不是偶數也不是奇數就不是整數
					((IF (NOT (ODD? an_atom)) 
						(IF (NOT (EVEN? an_atom)) #T #F) #F) 'nil)
			(ELSE #T)
		)
	)
)

;Test case
(atomIsInteger '())
(atomIsInteger 'a)
(atomIsInteger 1)
(atomIsInteger 2)


(IF (LIST? 'a) 'nil #F)
(
	; 判斷 atom 是否為整數
	; 解出值
	; 	#T
	; 	#F
	; 	'nil
		COND (
			; 錯誤輸入
				; 不能是 list
					((LIST? '()) 'nil)
				; 不是偶數也不是奇數就不是整數
					((IF (NOT (ODD? 'a)) 
						(IF (NOT (EVEN? 'a)) #T #F) #F) 'nil)
			(ELSE #T)
		)
	)