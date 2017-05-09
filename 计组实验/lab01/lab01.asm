###################################################################
#
#  冒泡排序算法 - 15331228 
#
###################################################################
.text                                  
  .globl main                           
    main:                              
    __init:
      la $a0, input_msg       # 准备输入信息 
      li $v0, 4               # 调用4号功能打印  输入信息
      syscall
      la $t0, array           # t0作为数组首地址
      li $t1, 0               # t1作为计数器计数10次 
      li $t2, 10              # t2作为比较标准数10次
			
    __input:
      li $v0, 5               # 调用 5号功能读取输入数存入v0
      syscall                 
      sw $v0, 0($t0)          # array[i] = input
      addiu $t1, $t1, 1       # 计数器(i) += 1
      addiu $t0, $t0, 4       # 数组地址(字) += 4
      bne $t1, $t2, __input   # if (计数器!=10) goto input
			
    __sort:
      li $t1, 0               # t1 = i 外层循环
      li $t2, 0               # t2 = j 内层循环
      li $t3, 0               # t3 = array[i]
      li $t4, 0               # t4 = array[j]
      li $t5, 0               # t5 = 临时变量		
      la $t7, array           # t7 = &array[i]		
      la $t8, array           # t8 = &array[j]
      li $t9, 10              # t9作为比较标准数10次
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
      la $a0, output_msg      # 准备输出信息 
      li $v0, 4               # 调用4号功能打印输出信息
      syscall
      la $t8, array           # t0作为数组首地址
      li $t9, 10              # t9作为比较标准数10次
      li $t1, 0               # t1 = i 外层循环
      li $t2, 0               # t2 = j 内层循环
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
      li $v0, 10              # 退出
      syscall                             

  
.data                                     
  array:
    .space 40                               #开辟10个.word(4)的数组  
  input_msg:
    .asciiz "Please input 10 numbers:\n"    #输入信息
  output_msg:
    .asciiz "After sorted the numbers:\n"   #输出信息
    

    