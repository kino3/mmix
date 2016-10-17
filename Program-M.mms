j	IS	$0
m	IS	$1
kk	IS	$2
xk	IS	$3
t	IS	$255
	LOC	#100
Maximum	SL	kk,$0,3
	LDO	m,x0,kk
	JMP	DecrK
Loop	LDO	xk,x0,kk
	CMP	t,xk,m
	PBNP	t,DecrK
ChangeM	SET	m,xk
	SR	j,kk,3
DecrK	SUB	kk,kk,8
	PBP	kk,Loop
	POP	2,0
