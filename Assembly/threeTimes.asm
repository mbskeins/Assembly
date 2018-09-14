.data
 intro: .asciiz "\nThis is Matt Skeins Presenting threeTimes"
first: .asciiz "\nEnter the 1st integer:  "
second: .asciiz "Enter the 2nd integer:  "
third: .asciiz "Enter the 3rd integer:  "
multiply: .asciiz "\nThe result of multiplication is: "
add: .asciiz "\nResult of addition of three numbers: "
 
.text
#setting muliply value to 3
addi $t4, $zero , 3

#intro to the program
li $v0,4
la $a0,intro
syscall

 #enter first int
li $v0,4
la $a0,first
syscall
 
li $v0,5 
syscall
move $t0,$v0 
 
 #enter second int
li $v0,4
la $a0,second
syscall
 
li $v0,5 
syscall
move $t1,$v0 
 
 #enter third int
li $v0,4
la $a0,third
syscall
 
li $v0,5 
syscall
move $t2,$v0 

#adding 3 numbers
add $t3, $t0, $t1
add $t3, $t3, $t2

#message of addition
li $v0, 4
la $a0, add
syscall
#print addition of integers
li $v0,1
move $a0, $t3
syscall


#message of multiplying
li $v0, 4
la $a0, multiply
syscall

#multiplying 
mul $s0,$t4,$t3

li $v0,1
add $a0, $zero,$s0 
syscall
 
li $v0,10
syscall