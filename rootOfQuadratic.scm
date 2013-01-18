; rootOfQuaadratic

(DEFINE (rootOfQuadratic a b c) (
	; 解一元二次方程式子程式
	; 求解
	; Evaluation
	; 　印出兩個根
	LET (
			; define temporary bindings
				; sqrt(pow(b, 2) - 4 * a * c) 
					(root_part_over_2a (/ (SQRT (- (* b b) (* 4 a c))) (* 2 a)))
				; -b / 2a
					(minus_b_over_2a (/ (- 0 b) (* 2 a)))
		) 
		(DISPLAY (+ minus_b_over_2a root_part_over_2a))
		(NEWLINE)
		(DISPLAY (- minus_b_over_2a root_part_over_2a))
	
	)
)

; test case
(rootOfQuadratic 1 2 3)