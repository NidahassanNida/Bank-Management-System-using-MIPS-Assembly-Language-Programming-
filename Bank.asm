.data
prompt1: .asciiz "\n\t\t===================="
prompt2:	.asciiz	"\n\t\t    BANK OF ENSS"
prompt3:	.asciiz	"\n\t\t====================\n" 
prompt4:	.asciiz	"\n\t\t1. Register account." 
prompt5:	.asciiz	"\n\t\t2. Login."
prompt6:	.asciiz	"\n\t\t3. Exit."
prompt7:	.asciiz	"\nEnter your choice : "

reg1:	.asciiz	"\n\n\t\t======================"
reg2:	.asciiz	"\n\t\tAccount Registeration"
reg3:	.asciiz	"\n\t\t======================" 
accName: .asciiz"\nEnter Name"
accAddress: .asciiz"Enter Address"
accCountactNum: .asciiz"Enter Contact Number"
userName: .asciiz"\nSet Username"
pass: .asciiz"Set Password"
depAmount: .asciiz"Enter intial amount"

astreik: .asciiz"\n********************************************************************************"
astreik1: .asciiz"********************************************************************************"
astreik2: .asciiz"********************************************************************************\n"
login1: .asciiz"\n\t\t\tWelocome "
login2: .asciiz"\n\t\t\t4. Deposit."
login3: .asciiz"\n\t\t\t5. Withdraw."
login4: .asciiz"\n\t\t\t6. Current Balance."
login5: .asciiz"\n\t\t\t7. User Information."
login6: .asciiz"\n\t\t\t8. Log out."
EnteruserName: .asciiz"Enter Username"
Enterpass: .asciiz"Enter Password"
invlaied: .asciiz"\n!!!!!!!!!!!!!!!Invalid Password!!!!!!!!!!!!!!!"
setAgain: .asciiz"\nSet again\n"

Enter: .asciiz"Enter Amount"
msgDeposit: .asciiz" Deposited To Your Acount"
msgWithdraw: .asciiz" Debited From Your Acount"
insuffitent: .asciiz"\nInsufficient Amount In Your Bank"
currentBlance: .asciiz"\nYour current Balance is "


exit1: .asciiz"\n\n\t\t\t\t*************************************************\n"
exit2: .asciiz"\t\t\t\t\t |-----------> ERROR <--------| \n"
exit3: .asciiz"\t\t\t\t\t\t\tOR\n"
exit4: .asciiz"\t\t\t\t\t There may be some othere Problem\n"
exit5: .asciiz"\t\t\t\t       It is better for you to try again...!\n"
exit6: .asciiz"\t\t\t\t*************************************************"


info1: .asciiz"\nAccount holder Name: "
info2: .asciiz"\nAccount holder Address: "
info3: .asciiz"\nAccount holder Contact Number: "


end1: .asciiz"\n\t\t   ThankYou For Using ENSS Bank\n\t\t\tPlease Come Again"
incorrext: .asciiz"\n\t\t!!!!!!!!Incorrect!!!!!!!!\n\t\t    Program Finished"
chances: .asciiz"\n\t\t\t\t\t\t\t\t\t\tNote:      You have "
chances1: .asciiz" chances "

str1: .space 20
str2: .space 20
Name: .space 40
Address: .space 40
Contact: .space 40

.text
.globl main
main:
li $s5,2
option_Displaying_Outer:
   li $v0, 4	
   la $a0, prompt1 
   syscall
   li $v0, 4
   la $a0, prompt2 
   syscall
   li $v0, 4	
   la $a0, prompt3 
   syscall
   li $v0, 4	
   la $a0, prompt4 
   syscall
   li $v0, 4	
   la $a0, prompt5 
   syscall
   li $v0, 4	
   la $a0, prompt6 
   syscall
   
   j choice
   
choice:         ############# choices method
   li $v0, 4
   la $a0, prompt7 
   syscall                  ############# printing prompt message of choices
   li $v0,5
   syscall
   move $t0,$v0         ############# choice in t0          
   
   
   ####if condtion
   beq $t0,1,acountRegisteration
   beq $t0,2,loginSystem
   beq $t0,3,end
   beq $t0,4,deposit
   beq $t0,5,withdraw
   beq $t0,6,CurentBalance
   beq $t0,7,info
   beq $t0,8,end

   j exit      ####else condtion

acountRegisteration:        #############account registeration method
   la $a0, reg1
   li $v0, 4	
   syscall                  ############# printing prompt message of registeration
   la $a0, reg2
   li $v0, 4	
   syscall
   la $a0, reg3
   li $v0, 4	
   syscall
   la $a0, accName
   li $v0, 4	
   syscall
   li $v0,8
   la $a0,Name
   li $a1,20            ############# acc Number in Name 
   syscall         

   la $a0, accAddress
   li $v0, 4	
   syscall
   li $v0,8
   la $a0,Address
   li $a1,20            ############# acc Address in Address 
   syscall

   la $a0, accCountactNum
   li $v0, 4	
   syscall
   li $v0,8
   la $a0,Contact
   li $a1,20            ############# acc Address in Address 
   syscall

   la $a0, userName
   li $v0, 4	
   syscall
   li $v0,8
   syscall
   move $t4,$v0         ############# username in t4

   li $v0, 4	
   la $a0, pass
   syscall
   li $v0,8
   la $a0,str1         ############# password in str1
   li $a1,20
   addi $a1,$zero,20   #a1=0+20
   syscall

   li $v0, 4	
   la $a0, depAmount
   syscall
   li $v0,5
   syscall
   move $t6,$v0         ############# Intial Amount in t6
   j option_Displaying_Outer
   
   
loginSystem:                  ############# login method
   la $a0, EnteruserName
   li $v0, 4	        ############# printing prompt message of username
   syscall
   li $v0,8
   syscall
   
   PASS:
   la $a0, Enterpass
   li $v0, 4	
   syscall
   li $v0,8
   la $a0,str2         ############# password in str2
   li $a1,20
   addi $a1,$zero,20
   syscall
   
   
   ########following is code of checking if password is correct or not
   la $a0,str1  #pass address of str1
   la $a1,str2  #pass address of str2
   jal strcmp  #call strcmp
   
   beq $v0,$zero,underAccount #check result
   li $v0,4
   la $a0,invlaied                  ###########################not same
   syscall
   
   li $v0,4
   la $a0,chances
   syscall
   
   move $a0, $s5
   li $v0, 1
   syscall
   
   li $v0,4
   la $a0,chances1
   syscall
   
   set_again:          #############set again method   
      beqz $s5, incorrect
      subi $s5,$s5,1 
      li $v0,4
      la $a0,setAgain
      syscall
      j PASS
   
   
   strcmp:
   add $t9,$zero,$zero
   add $t1,$zero,$a0
   add $t2,$zero,$a1
   loop:
   lb $t3($t1)  #load a byte from each string
   lb $t4($t2)
   beqz $t3,checkt2 #str1 end
   beqz $t4,missmatch
   sne $t5,$t3,$t4  #compare two bytes
   bnez $t5,missmatch
   addi $t1,$t1,1  #t1 points to the next byte of str1
   addi $t2,$t2,1
   j loop
   
   missmatch: 
   addi $v0,$zero,1
   j endfunction
   
   checkt2:
   bnez $t4,missmatch
   add $v0,$zero,$zero
   
   endfunction:
   jr $ra
   
   #####following is the code if user sucesfully login into account
   underAccount:
      la $a0, astreik
      li $v0, 4
      syscall
      la $a0, login1
      li $v0, 4	
      syscall
      la $a0, Name
      li $v0, 4	
      syscall
      la $a0, astreik1
      li $v0, 4	
      syscall
      
      option_Displaying_Inner:
      li $v0, 4	
      la $a0, login2   
      syscall
      li $v0, 4	
      la $a0, login3 
      syscall
      li $v0, 4	
      la $a0, login4 
      syscall
      li $v0, 4	
      la $a0, login5 
      syscall
      li $v0, 4	
      la $a0, login6 
      syscall
      j choice
      
deposit:
   la $a0, Enter
   li $v0, 4	
   syscall
   li $v0,5
   syscall
   move $t8,$v0
   add $t6,$t6,$t8         ############# amount stored in t6
   
   la $a0, astreik2
   li $v0, 4	
   syscall
   move $a0, $t8
   li $v0, 1
   syscall
   
   la $a0, msgDeposit
   li $v0, 4	
   syscall
   
   la $a0, astreik
   li $v0, 4	
   syscall 
   j option_Displaying_Inner

withdraw:
   la $a0, Enter
   li $v0, 4	
   syscall
   li $v0,5
   syscall
   move $t9,$v0
   bge $t6,$t9,witdrw
###########if amount is not enogh in account    
   la $a0, astreik
   li $v0, 4	
   syscall
   la $a0, insuffitent
   li $v0, 4	
   syscall
   la $a0, astreik
   li $v0, 4	
   syscall
   j option_Displaying_Inner
   
   witdrw:
      la $a0, astreik2
      li $v0, 4	
      syscall
      sub $t6,$t6,$t9
      move $a0, $t9
      li $v0, 1
      syscall
      
      la $a0, msgWithdraw
      li $v0, 4	
      syscall
      la $a0, astreik
      li $v0, 4	
      syscall
      j option_Displaying_Inner

CurentBalance:
   li $v0, 4
   la $a0, astreik
   syscall
   la $a0, currentBlance
   li $v0, 4	
   syscall
   
   move $a0, $t6
   li $v0, 1
   syscall
   li $v0, 4
   la $a0, astreik 
   syscall
   j option_Displaying_Inner

info:
   li $v0, 4
   la $a0, astreik 
   syscall	
   la $a0, info1 
   li $v0, 4
   syscall
   
   la $a0,Name
   li $v0, 4
   syscall
   li $v0, 4
   la $a0, astreik1 
   syscall
   la $a0, info2
   li $v0, 4
   syscall
   la $a0,Address
   li $v0, 4
   syscall
   li $v0, 4
   la $a0, astreik1 
   syscall
   li $v0, 4	
   la $a0, info3 
   syscall
   la $a0,Contact
   li $v0, 4
   syscall
   li $v0, 4
   la $a0, astreik1 
   syscall
   j option_Displaying_Inner

exit:
   la $a0, exit1
   li $v0, 4	
   syscall
   la $a0, exit2
   li $v0, 4	
   syscall
   la $a0, exit3
   li $v0, 4	
   syscall
   la $a0, exit4
   li $v0, 4	
   syscall
   la $a0, exit5
   li $v0, 4	
   syscall
   la $a0, exit6
   li $v0, 4	
   syscall
   li $v0,10
   syscall
   
end: 
   li $v0, 4	 
   la $a0, astreik 
   syscall
   la $a0, end1
   li $v0, 4
   syscall
   li $v0, 4
   la $a0, astreik 
   syscall
   li $v0,10
   syscall  
   
incorrect:
   la $a0, astreik
   li $v0, 4	
   syscall
   li $v0,4
   la $a0,incorrext ###########################not same
   syscall
   la $a0, astreik
   li $v0, 4	
   syscall
   li $v0,10
   syscall
