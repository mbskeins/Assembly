#
#
#
# Matt Skeins
#
# This project asks the user to eneter the amount of floats desired to average, takes input for them, then averages the floats
#


.data
     prompt: .asciiz "how many numbers would you like to average?  "
     prompt3: .asciiz "The average is:   "
     prompt2: .asciiz "Please enter a 3 digit decimal d.dd: "
     size:   .word 4
.text

    main:
        #print prompt
        la $a0 prompt
        li $v0 4
        syscall

        #get int
        li $v0 5
        syscall
       move $t0, $v0
	
        #allocate space?
        sll $a0 $v0 2 #number of bytes now in $a0
        move $s1, $a0 #number of bytes in $s1
        li  $v0 9
        syscall 
             
        #$s0 now has address of array
        move $s0,$v0
         
       #jump to looping function
       	j loop
        
        loop:
        #$s2 is counter $s1 has max bits if equal average the numbers
        beq $s2,$s1, average
        
        #prompt is printing
  	la $a0 prompt2
        li $v0 4
        syscall
        
        #asking user to input float
        li $v0, 6
        syscall
        mov.s $f1,$f0
      	swc1 $f1, 0($s0)
        
        #incrementing index and counter
        addi $s2, $s2, 4
        addi $s0, $s0, 4
        j loop
        
  	average:
  	#loop through array and pull numbers
  	
  	beq $s2,$zero, exit
  	#decreamenting counter
  	subi $s2, $s2, 4
        subi $s0, $s0, 4
        
        #loading elemant from array
  	lwc1 $f1, 0($s0)
  	add.s $f3, $f3,$f1
  	
  	j average
  	#decreamenting counter
  	
  	exit:
  	#dividing all numbers added, then convert int to float from orignal input then divide to get average
  	mtc1 $t0,$f4
  	cvt.s.w $f5,$f4
  	div.s $f3,$f3,$f5
  	 	
  	#prompt is printing
  	la $a0 prompt2
        li $v0 4
        syscall
  	#print average
  	li $v0, 2
  	mov.s $f12,$f3
  	syscall
  	
  	
  	
  	
  	
     
