(DEFINE (factorial n)
	(IF (= n 0)
		; 基礎狀況： 0! = 1
		1
		; n! = n * (n - 1)!
		(* n (factorial (- n 1)))
	)
)

(DISPLAY (factorial 0))
(DISPLAY (factorial 1))
(DISPLAY (factorial 2))
(DISPLAY (factorial 3))
(DISPLAY (factorial 4))
