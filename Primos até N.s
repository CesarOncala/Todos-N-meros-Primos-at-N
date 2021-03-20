.data
Ola: .asciiz "Nome: Cesar Henrique Alves Oncala \nProfessor: Cabra \nPontificia Universidade Catolica\n\n"
Mensagem: .asciiz "\nDigite um numero para ver todos os numeros primos ate ele\n"
virgula: .asciiz " , "
Media: .asciiz "\n\nMedia dos numeros primos listados, 'sem parte decimal':\n"
Cesar: .asciiz "\n\nTrabalho concluido, obrigado ! \n:)"
.text

main: addi $sp,$sp,-28
      sw $s0,0($sp)
      sw $s1,4($sp)
      sw $a0,8($sp)
      sw $ra,12($sp)
      sw $s2,16($sp)
      sw $s3,20($sp)
      addi $v0,$zero,4
      la $a0, Ola
      syscall
      addi $v0,$zero,4
      la $a0, Mensagem
      syscall
      addi $v0,$zero,5
      syscall
      add $s0,$zero,$v0 # n
      addi $s1,$zero,1   # i
for:  sle $t0,$s1,$s0
      beq $t0,$zero,Fim
      add $a0,$zero,$s1
      jal PRIMOS
      if: bne $v0,1,Fim_IF
          add $s2,$s2,$s1
          addi $s3,$s3,1
          addi $v0,$zero,1
          add $a0,$zero,$s1
          syscall
          addi $v0,$zero,4
          la $a0, virgula
          syscall
      Fim_IF: addi $s1,$s1,1
              j for 
   
Fim: div $t6,$s2,$s3
     addi $v0,$zero,4
     la $a0,Media
     syscall
     addi $v0,$zero,1
     add $a0,$zero,$t6
     syscall
     addi $v0,$zero,4
     la $a0, Cesar
     syscall
     lw $s3,20($sp)
     lw $s2,16($sp)
     lw $ra,12($sp)
     lw $a0,8($sp)
     lw $s1,4($sp)
     lw $s0,0($sp)
     addi $sp,$sp,28   
     jr $ra

PRIMOS: addi $sp,$sp,-20
        sw $s0,0($sp)
        sw $s1,4($sp)
        sw $a0,8($sp)
        sw $ra,12($sp)
        addi $s0,$zero,0 #p
        addi $s1,$zero,1 #i
        for1: sle $t0,$s1,$a0
              beq $t0,$zero,Fim_for
              if1: rem $t0,$a0,$s1
                   bne $t0,0,continua
                   addi $s0,$s0,1
              continua: addi $s1,$s1,1
                        j for1

Fim_for:    bne $s0,2,outroreturn
            addi $v0,$zero,1
            lw $ra,12($sp)
            lw $a0,8($sp)
            lw $s1,4($sp)
            lw $s0,0($sp)
            addi $sp,$sp,20
            jr $ra
         outroreturn: addi $v0,$zero,0
                      lw $ra,12($sp)
                      lw $a0,8($sp)
                      lw $s1,4($sp)
                      lw $s0,0($sp)
                      addi $sp,$sp,20
                      jr $ra
       

              
        
        


          
      
         
      
     