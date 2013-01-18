(DEFINE (compareSize first second)
	(COND
		((> first second) (DISPLAY "第一個比第二個大。"))
		((< first second) (DISPLAY "第二個比第一個大。"))
		(ELSE (DISPLAY "第一個跟第二個一樣大"))
	)
)