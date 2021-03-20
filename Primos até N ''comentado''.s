.data
Ola: .asciiz "Nome: Cesar Henrique Alves Oncala \nProfessor: Cabra \nPontificia Universidade Catolica\n\n"
Mensagem: .asciiz "\nDigite um numero para ver todos os numeros primos ate ele\n"
virgula: .asciiz " , "
Media: .asciiz "\n\nMedia dos numeros primos listados, 'sem parte decimal':\n"
Cesar: .asciiz "\n\nTrabalho concluido, obrigado ! \n:)"
.text

main: addi $sp,$sp,-28 # 
      sw $s0,0($sp)    #
      sw $s1,4($sp)    #
      sw $a0,8($sp)    # empilhando os registradores, $s0,$$s1,$a0,$ra,$s2,$s3
      sw $ra,12($sp)   #
      sw $s2,16($sp)   #
      sw $s3,20($sp)   #
      addi $v0,$zero,4 # código de mostrar a string
      la $a0, Ola      # $a0 recebendo a mensagem de "Ola"
      syscall          # chamando o sistema para imprimir a mensagem de "Ola"
      addi $v0,$zero,4 #  código de mostrar string 
      la $a0, Mensagem # $a0, rebendo "Mensagem"
      syscall          # imprimindo "Mensagem"
      addi $v0,$zero,5 # código de reber inteiro
      syscall          # chamando o sistema para receber o inteiro
      add $s0,$zero,$v0 # n
      addi $s1,$zero,1  # i
for:  sle $t0,$s1,$s0   # i<=n
      beq $t0,$zero,Fim # se i<=n pula para "Fim"
      add $a0,$zero,$s1 # passando i como parametro, $a0=$s1
      jal PRIMOS        # ir para função "PRIMOS"
      if: bne $v0,1,Fim_IF # se $v0 != 1, pula para Fim-IF
          add $s2,$s2,$s1  # $soma+=i
          addi $s3,$s3,1   # cont++
          addi $v0,$zero,1 # código de mostrar inteiro
          add $a0,$zero,$s1 # passando $s1 "i" para $a0
          syscall          # chamando o sistema para imprimir "i"
          addi $v0,$zero,4 # código de chamar string
          la $a0, virgula  # $a0= "virgula"
          syscall          # imprimindo "virgula"
      Fim_IF: addi $s1,$s1,1 # I++
              j for          # pulando para o for  
   
Fim: div $t6,$s2,$s3  # $t6= soma/cont
     addi $v0,$zero,4 # Código de imprmimir string
     la $a0,Media     # $a0 recebe string "Media"
     syscall          # imprimindo a string "Media"
     addi $v0,$zero,1 # código de imprimir inteiro
     add $a0,$zero,$t6 # $a0 = $t6
     syscall           # chamando o sistema para imprimir oque está em $a0
     addi $v0,$zero,4  # Código de imprimir string
     la $a0, Cesar     # $a0 rebe string "Cesar"
     syscall           # chamando o sistema para imprimir $a0
     lw $s3,20($sp)    #
     lw $s2,16($sp)    #
     lw $ra,12($sp)    #
     lw $a0,8($sp)     # Desempilhando registradores: $s0,$s1,$a0,$ra,$s2,$s3
     lw $s1,4($sp)     #
     lw $s0,0($sp)     #
     addi $sp,$sp,28   # 
     jr $ra            # return

PRIMOS: addi $sp,$sp,-20 #
        sw $s0,0($sp)    #
        sw $s1,4($sp)    #
        sw $a0,8($sp)    # Empilhando os registradores $s0,$s1,$a0,$ra,
        sw $ra,12($sp)   #
        addi $s0,$zero,0 #p
        addi $s1,$zero,1 #i
        for1: sle $t0,$s1,$a0 # i<=o
              beq $t0,$zero,Fim_for # !(i<=o) pula para "Fim_for
              if1: rem $t0,$a0,$s1  # $t0=o%i
                   bne $t0,0,continua # se $t0!=0 pula para "continua" 
                   addi $s0,$s0,1     #p++
              continua: addi $s1,$s1,1 #i++
                        j for1  # pula para for1

Fim_for:    bne $s0,2,outroreturn # p!=2 pula para "outroreturn"
            addi $v0,$zero,1 #$v0=1
            lw $ra,12($sp)   #
            lw $a0,8($sp)    #
            lw $s1,4($sp)    #
            lw $s0,0($sp)    # Desempilhando $ra,$a0,$s1,$s0
            addi $sp,$sp,20  #
            jr $ra           # return
         outroreturn: addi $v0,$zero,0 # $v0=0
                     lw $ra,12($sp)   #
            	     lw $a0,8($sp)    #
         	     lw $s1,4($sp)    #
           	     lw $s0,0($sp)    # Desempilhando $ra,$a0,$s1,$s0
            	     addi $sp,$sp,20  #
                     jr $ra           # return
       

              
        
        


          
      
         
      
     