(DEFINE (listConcatenate list1 list2) (
	COND
		; 基本狀況 - list1 變為空 list
			((NULL? list1) list2)
		; 取 list1 第一個參數，連接其餘的
			(ELSE 
				(CONS (CAR list1) (listConcatenate (CDR list1) list2)))
	)
)

; test case
(listConcatenate '(a b) '(c d))
; ==> (a b c d)
(listConcatenate '(b) '(c d))
; ==> (b c d)
(listConcatenate '() '(c d))
; ==> (c d)

; special input
(listConcatenate '((d e f)) '((b c) c d))
; ==> ((d e f) (b c) c d)
