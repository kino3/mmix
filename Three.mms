% nabeatsu (like fizzbuzz)
max 	IS	100
t	IS	$255
num	GREG	0
ahonum	GREG	0
q	GREG	0
r	GREG	0
end	GREG	0
mul3	GREG	0
occ3	GREG	0
	LOC	Data_Segment
	GREG	@
BUF	OCTA	0
Title	BYTE	"multiples of 3 or occurences of 3"
NewLn	BYTE	#a,0
DEBUG	BYTE	"debug"
AHO	BYTE	" aho" 
	LOC	#100
	GREG	@
Main	SET	num,1
	LDA	t,Title
	TRAP	0,Fputs,StdOut
% Main Loop
0H	JMP	3F % print n
1H	LDA	t,NewLn
	TRAP	0,Fputs,StdOut
	INCL	num,1
	CMP	end,num,max
	BNP	end,0B
% End Program
	TRAP	0,Halt,0
% Printing and Check 3
3H	SET	ahonum,num
4H	GREG	#2020202000000000
	STOU	4B,BUF
	LDA	t,BUF+4
5H	DIV	ahonum,ahonum,10
	GET	r,rR
	INCL	r,'0'
	STBU	r,t,0
	SUB	t,t,1
	PBNZ	ahonum,5B
	LDA	t,BUF
	TRAP	0,Fputs,StdOut
	SET	ahonum,num
	DIV	q,ahonum,3
	GET	r,rR
	BZ	r,6F
	JMP	1B
6H	LDA	t,AHO
	TRAP	0,Fputs,StdOut
	JMP	1B