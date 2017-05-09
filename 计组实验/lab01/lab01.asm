###################################################################
#
#  ð�������㷨 - 15331228 
#
###################################################################
.text                                  
  .globl main                           
    main:                              
    __init:
      la $a0, input_msg       # ׼��������Ϣ 
      li $v0, 4               # ����4�Ź��ܴ�ӡ  ������Ϣ
      syscall
      la $t0, array           # t0��Ϊ�����׵�ַ
      li $t1, 0               # t1��Ϊ����������10�� 
      li $t2, 10              # t2��Ϊ�Ƚϱ�׼��10��
			
    __input:
      li $v0, 5               # ���� 5�Ź��ܶ�ȡ����������v0
      syscall                 
      sw $v0, 0($t0)          # array[i] = input
      addiu $t1, $t1, 1       # ������(i) += 1
      addiu $t0, $t0, 4       # �����ַ(��) += 4
      bne $t1, $t2, __input   # if (������!=10) goto input
			
    __sort:
      li $t1, 0               # t1 = i ���ѭ��
      li $t2, 0               # t2 = j �ڲ�ѭ��
      li $t3, 0               # t3 = array[i]
      li $t4, 0               # t4 = array[j]
      li $t5, 0               # t5 = ��ʱ����		
      la $t7, array           # t7 = &array[i]		
      la $t8, array           # t8 = &array[j]
      li $t9, 10              # t9��Ϊ�Ƚϱ�׼��10��
      __loop1:                  # for (i = 0; i < 10; i++)
        lw $t3, 0($t7)          # t3 = array[i]
        move $t2, $t1           # j = i
				move $t8, $t7           # &array[j] = &array[i]
				__loop2:                  # for (j = i; j < 10; j++)
          lw $t3, 0($t7)          # t3 = array[i]
          lw $t4, 0($t8)          # t4 = array[j]
            sltu $t5, $t3, $t4    # if (a[i] < a[j]) goto change else goto __nochange
						beqz $t5, __nochange
            __change:
						  sw $t3, 0($t8)
						  sw $t4, 0($t7)
						__nochange:
					addiu $t8, $t8, 4     # &array[j++]  
					addiu $t2, $t2, 1     # j++
					bne $t2, $t9,__loop2   # if (j!=10) goto__loop2
				  addiu $t7, $t7, 4     # &array[i++]  
				  addiu $t1, $t1, 1     # i++
				  bne $t1, $t9,__loop1   # if (i!=10) goto__loop1
				
		
    __output:
      la $a0, output_msg      # ׼�������Ϣ 
      li $v0, 4               # ����4�Ź��ܴ�ӡ�����Ϣ
      syscall
      la $t8, array           # t0��Ϊ�����׵�ַ
      li $t9, 10              # t9��Ϊ�Ƚϱ�׼��10��
      li $t1, 0               # t1 = i ���ѭ��
      li $t2, 0               # t2 = j �ڲ�ѭ��
			__loop_print:
        lw $a0, 0($t8)
				li $v0, 1
				syscall
        li $a0, 32
				li $v0, 11
				syscall
      addiu $t8, $t8, 4       
      addiu $t1, $t1, 1       # i++
      bne $t1, $t9, __loop_print     # if (i!=10) goto __loop_print
		
    __exit:		
      li $v0, 10              # �˳�
      syscall                             

  
.data                                     
  array:
    .space 40                               #����10��.word(4)������  
  input_msg:
    .asciiz "Please input 10 numbers:\n"    #������Ϣ
  output_msg:
    .asciiz "After sorted the numbers:\n"   #�����Ϣ
    

    