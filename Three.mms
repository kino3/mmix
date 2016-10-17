% nabeatsu (like fizzbuzz)
max 	IS	50
t	IS	$255
num	GREG	0
ahonum	GREG	0
q	GREG	0
r	GREG	0
end	GREG	0

	LOC	Data_Segment
	GREG	@
BUF	OCTA	0
Title	BYTE	"multiples of 3 or occurences of 3"
NewLn	BYTE	#a,0
DEBUG	BYTE	"debug"
	LOC	#100
	GREG	@
Main	SET	num,1
	LDA	t,Title
	TRAP	0,Fputs,StdOut
2H	DIV	q,num,3
	GET	r,rR
	BZ	r,4F
3H	INCL	num,1
	CMP	end,num,max
	BNP	end,2B
	TRAP	0,Halt,0
4H	SET	ahonum,num
0H	GREG	#3030303000000000
	STOU	0B,BUF
	LDA	t,BUF+4
1H	DIV	ahonum,ahonum,10
	GET	r,rR
	INCL	r,'0'
	STBU	r,t,0
	SUB	t,t,1
	PBNZ	ahonum,1B
	LDA	t,BUF
	TRAP	0,Fputs,StdOut
	LDA	t,NewLn
	TRAP	0,Fputs,StdOut
	JMP	3B