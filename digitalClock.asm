;O CODIGO IMPRIME OQ DIGITAR, MAS A VERIFICACAO DE HORA SO FUNCIONA NA UNIDADE DE SEGUNDOS
;FALTA ARRUMAR HORARIO, COLOCAR CORES E VERIFICAR SE A ENTRADA EH VALIDA


data segment         
   
   
    LINHA  DB ?
    COLUNA DB ?  
    COLUNA_UNID DB ? 
    COLUNA_DEZ DB ?
    DIGITO DB ?               
    DIGITO_UNI DB ?
    DIGITO_DEZ DB ?   
    SEGUNDOS_DEZ DB ?,10,0
    SEGUNDOS_UNI DB ?,10,0
    MINUTOS_DEZ DB ?,10,0 
    MINUTOS_UNI DB ?,10,0
    QUANTOS_SEG DB "DIGITE OS SEGUNDOS:", 10, 0
    QUANTOS_MIN DB "DIGITE OS MINUTOS:", 10, 0   
    NUMERO_INVALIDO DB "O NUMERO INFORMADO E INVALIDO", 10, 0    
    NUMERO_ATUAL DB ?  
    COLOR DB 11 ; cyan blue
   
   
ZERO    DB "     000000000      ",10
        DB "   00:::::::::00    ",10
        DB " 00:::::::::::::00  ",10
        DB "0:::::::000:::::::0 ",10
        DB "0::::::0   0::::::0 ",10
        DB "0:::::0     0:::::0 ",10
        DB "0:::::0     0:::::0 ",10
        DB "0:::::0 000 0:::::0 ",10
        DB "0:::::0 000 0:::::0 ",10
        DB "0:::::0     0:::::0 ",10
        DB "0:::::0     0:::::0 ",10
        DB "0::::::0   0::::::0 ",10
        DB "0:::::::000:::::::0 ",10
        DB " 00:::::::::::::00  ",10
        DB "   00:::::::::00    ",10
        DB "     000000000      ",0

UM      DB "     1111111        ",10
        DB "    1::::::1        ",10
        DB "   1:::::::1        ",10
        DB "   111:::::1        ",10
        DB "      1::::1        ",10
        DB "      1::::1        ",10
        DB "      1::::1        ",10
        DB "      1::::l        ",10
        DB "      1::::l        ",10
        DB "      1::::l        ",10
        DB "      1::::l        ",10
        DB "      1::::l        ",10
        DB "   111::::::111     ",10
        DB "   1::::::::::1     ",10
        DB "   1::::::::::1     ",10
        DB "   111111111111     ",0
                   
DOIS    DB " 222222222222222    ",10
        DB "2:::::::::::::::22  ",10
        DB "2::::::222222:::::2 ",10
        DB "2222222     2:::::2 ",10
        DB "            2:::::2 ",10
        DB "            2:::::2 ",10
        DB "         2222::::2  ",10
        DB "    22222::::::22   ",10
        DB "  22::::::::222     ",10
        DB " 2:::::22222        ",10
        DB "2:::::2             ",10
        DB "2:::::2             ",10
        DB "2:::::2       222222",10
        DB "2::::::2222222:::::2",10
        DB "2::::::::::::::::::2",10
        DB "22222222222222222222",0

TRES    DB " 333333333333333    ",10
        DB "3:::::::::::::::33  ",10
        DB "3::::::33333::::::3 ",10
        DB "3333333     3:::::3 ",10
        DB "            3:::::3 ",10
        DB "            3:::::3 ",10
        DB "    33333333:::::3  ",10
        DB "    3:::::::::::3   ",10
        DB "    33333333:::::3  ",10
        DB "            3:::::3 ",10
        DB "            3:::::3 ",10
        DB "            3:::::3 ",10
        DB "3333333     3:::::3 ",10
        DB "3::::::33333::::::3 ",10
        DB "3:::::::::::::::33  ",10
        DB " 333333333333333    ",0
                       

QUATRO  DB "       444444444    ",10
        DB "      4::::::::4    ",10
        DB "     4:::::::::4    ",10
        DB "    4::::44::::4    ",10
        DB "   4::::4 4::::4    ",10
        DB "  4::::4  4::::4    ",10
        DB " 4::::4   4::::4    ",10
        DB "4::::444444::::444  ",10
        DB "4::::::::::::::::4  ",10
        DB "4444444444:::::444  ",10
        DB "          4::::4    ",10
        DB "          4::::4    ",10
        DB "          4::::4    ",10
        DB "        44::::::44  ",10
        DB "        4::::::::4  ",10
        DB "        4444444444  ",0
       
CINCO   DB "555555555555555555  ",10
        DB "5::::::::::::::::5  ",10
        DB "5::::::::::::::::5  ",10
        DB "5:::::555555555555  ",10
        DB "5:::::5             ",10
        DB "5:::::5             ",10
        DB "5:::::5555555555    ",10
        DB "5:::::::::::::::5   ",10
        DB "555555555555:::::5  ",10
        DB "            5:::::5 ",10
        DB "            5:::::5 ",10
        DB "5555555     5:::::5 ",10
        DB "5::::::55555::::::5 ",10
        DB " 55:::::::::::::55  ",10
        DB "   55:::::::::55    ",10
        DB "     555555555      ",0
       
SEIS    DB "        66666666    ",10
        DB "       6::::::6     ",10
        DB "      6::::::6      ",10
        DB "     6::::::6       ",10
        DB "    6::::::6        ",10
        DB "   6::::::6         ",10
        DB "  6::::::6          ",10
        DB " 6::::::::66666     ",10
        DB "6::::::::::::::66   ",10
        DB "6::::::66666:::::6  ",10
        DB "6:::::6     6:::::6 ",10
        DB "6:::::6     6:::::6 ",10
        DB "6::::::66666::::::6 ",10
        DB " 66:::::::::::::66  ",10
        DB "   66:::::::::66    ",10
        DB "     666666666      ",0

SETE    DB "77777777777777777777",10
        DB "7::::::::::::::::::7",10
        DB "7::::::::::::::::::7",10
        DB "777777777777:::::::7",10
        DB "           7::::::7 ",10
        DB "          7::::::7  ",10
        DB "         7::::::7   ",10
        DB "        7::::::7    ",10
        DB "       7::::::7     ",10
        DB "      7::::::7      ",10
        DB "     7::::::7       ",10
        DB "    7::::::7        ",10
        DB "   7::::::7         ",10
        DB "  7::::::7          ",10
        DB " 7::::::7           ",10
        DB "77777777            ",0
                           
OITO    DB "     888888888      ",10
        DB "   88:::::::::88    ",10
        DB " 88:::::::::::::88  ",10
        DB "8::::::88888::::::8 ",10
        DB "8:::::8     8:::::8 ",10
        DB "8:::::8     8:::::8 ",10
        DB " 8:::::88888:::::8  ",10
        DB "  8:::::::::::::8   ",10
        DB " 8:::::88888:::::8  ",10
        DB "8:::::8     8:::::8 ",10
        DB "8:::::8     8:::::8 ",10
        DB "8:::::8     8:::::8 ",10
        DB "8::::::88888::::::8 ",10
        DB " 88:::::::::::::88  ",10
        DB "   88:::::::::88    ",10
        DB "     888888888      ",0
                     
NOVE    DB "     999999999      ",10
        DB "   99:::::::::99    ",10
        DB " 99:::::::::::::99  ",10
        DB "9::::::99999::::::9 ",10
        DB "9:::::9     9:::::9 ",10
        DB "9:::::9     9:::::9 ",10
        DB " 9:::::99999::::::9 ",10
        DB "  99::::::::::::::9 ",10
        DB "    99999::::::::9  ",10
        DB "         9::::::9   ",10
        DB "        9::::::9    ",10
        DB "       9::::::9     ",10
        DB "      9::::::9      ",10
        DB "     9::::::9       ",10
        DB "    9::::::9        ",10
        DB "   99999999         ",0
ends             
                 
stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ax, data
    mov ds, ax
    mov es, ax
   
    MOV AH,1
    MOV CH,20H
    INT 10H
    ;DESLIGA CURSOR   
    
    MOV AX, 0B800H
    MOV ES, AX

    
    MOV COLUNA_UNID, 1  
    MOV COLUNA_DEZ, 0  
    MOV LINHA, 0
    MOV COLUNA, 0
    
RECEBE_DADOS:  
      
    ;CALL CLRSCR
    
    CALL IMP_PERG_SEG
    CALL LER_SEG_DEZ 
    CALL LER_SEG_UNI
                     
    
    MOV COLUNA, 0
    CALL IMP_PERG_MIN
    MOV COLUNA, 0
    CALL LER_MIN_DEZ
    CALL LER_MIN_UNI  
    
    
    CALL VERIFICA_INPUT
           
           
    ;Converte de ASCII    
    SUB SEGUNDOS_DEZ, 48 
    SUB SEGUNDOS_UNI, 48 
    SUB MINUTOS_DEZ, 48  
    SUB MINUTOS_UNI, 48 
    


MOSTRANDO:
    CALL DELAY_1_SEG  
    INC SEGUNDOS_UNI
    CALL VERIFICA_HORA

    ; IMPRIME DEZ SS

    MOV AL, SEGUNDOS_DEZ
    MOV DIGITO,AL
    MOV LINHA,  5
    MOV COLUNA, 40  
    MOV NUMERO_ATUAL, 1  
    CALL TROCA_COR_DEZENA_SEGUNDOS
    CALL IMPRIME_DIGITO                             
               
    ; IMPRIME UNID SS

    MOV AL, SEGUNDOS_UNI           
    MOV DIGITO,AL
    MOV LINHA,  5
    MOV COLUNA, 60     
    MOV NUMERO_ATUAL, 2  
    CALL TROCA_COR_UNIDADE_SEGUNDOS
    CALL IMPRIME_DIGITO                             
       
    ; IMPRIME DEZ MM 

    MOV AL,MINUTOS_DEZ
    MOV DIGITO,AL
    MOV LINHA,  5
    MOV COLUNA, 0
    MOV NUMERO_ATUAL, 3
    CALL TROCA_COR_DEZENA_MINUTOS
    CALL IMPRIME_DIGITO                             
               
    ; IMPRIME UNID MM
          
    MOV AL,MINUTOS_UNI
    MOV DIGITO,AL
    MOV LINHA,  5
    MOV COLUNA, 20     
    MOV NUMERO_ATUAL, 4    
    CALL TROCA_COR_UNIDADE_MINUTOS   
    CALL IMPRIME_DIGITO                             

    JMP MOSTRANDO
   
    mov ax, 4c00h
    int 21h   

IMPRIME_DIGITO:
    CMP DIGITO,0
    JE IMP_ZERO
    CMP DIGITO,1
    JE IMP_UM
    CMP DIGITO,2
    JE IMP_DOIS
    CMP DIGITO,3
    JE IMP_TRES
    CMP DIGITO,4
    JE IMP_QUATRO
    CMP DIGITO,5
    JE IMP_CINCO
    CMP DIGITO,6
    JE IMP_SEIS
    CMP DIGITO,7
    JE IMP_SETE
    CMP DIGITO,8
    JE IMP_OITO
    CMP DIGITO,9
    JE IMP_NOVE


IMP_ZERO:
    LEA SI, ZERO  
    JMP IMPRIMINDO
IMP_UM:
    LEA SI, UM 
    JMP IMPRIMINDO
IMP_DOIS:
    LEA SI, DOIS
    JMP IMPRIMINDO
IMP_TRES:
    LEA SI, TRES
    JMP IMPRIMINDO
IMP_QUATRO:
    LEA SI, QUATRO
    JMP IMPRIMINDO
IMP_CINCO:
    LEA SI, CINCO
    JMP IMPRIMINDO
IMP_SEIS:
    LEA SI, SEIS
    JMP IMPRIMINDO
IMP_SETE:
    LEA SI, SETE
    JMP IMPRIMINDO
IMP_OITO:
    LEA SI, OITO
    JMP IMPRIMINDO
IMP_NOVE:
    LEA SI, NOVE
    JMP IMPRIMINDO  
    
IMP_PERG_SEG:
    LEA SI, QUANTOS_SEG
    JMP IMPRIMINDO
    RET

IMP_PERG_MIN:
    LEA SI, QUANTOS_MIN
    JMP IMPRIMINDO  
    RET    
    
IMP_ERRO:
    LEA SI, NUMERO_INVALIDO 
    MOV COLUNA, 0
    JMP IMPRIMINDO
    RET    
    
REINICIA_RECEBIMENTO_ERRO:
    CALL IMP_ERRO
    CALL DELAY_1_SEG  
    CALL start    
    
;APAGA TECLA COMPLETAMENTE    
CLRSCR: 
    PUSHF
    PUSH SI 
    PUSH AX
    PUSH BX
    PUSH DX
    MOV SI, 0
CLRSCR_APAGANDO:    
    MOV ES:[SI]," "
    MOV ES:[SI+1],0FH
    ADD SI, 2
    CMP SI, 25*(80*2)
    JE  SAI_CLRSCR  
    JMP CLRSCR_APAGANDO
SAI_CLRSCR:          
    ;Set cursor position	AH=02h	BH = Page Number, DH = Row, DL = Column
    MOV AH,2
    MOV BH,0
    MOV DH,0
    MOV DL,0
    INT 10H
    ; APAGA CURSOR 
    MOV AH,1
    MOV CH,28H
    MOV CL,09H
    INT 10H
    POP DX
    POP BX
    POP AX
    POP SI
    POPF
    RET    
  
    
    
LER_SEG_DEZ: 
    mov ah, 0
    mov al, 10H  
    
    int 16h   
   
    
IMPRIME_SEG_DEZ: 
    MOV SEGUNDOS_DEZ, AL
    LEA SI, SEGUNDOS_DEZ 
    MOV AL, COLUNA_DEZ
    MOV COLUNA, AL
    JMP IMPRIMINDO
    RET 

LER_SEG_UNI: 
    mov ah, 0
    mov al, 10H
    int 16h 
IMPRIME_SEG_UNI: 
    MOV SEGUNDOS_UNI, AL
    LEA SI, SEGUNDOS_UNI  
    MOV AH, 3
    INT 10H 
    MOV AL, COLUNA_UNID
    MOV COLUNA, AL   
    DEC LINHA
    JMP IMPRIMINDO
    RET
 
    
LER_MIN_DEZ:
    mov ah, 0
    mov al, 10H
    int 16h 
IMPRIME_MIN_DEZ: 
    MOV MINUTOS_DEZ, AL 
    MOV BH, MINUTOS_DEZ
    LEA SI, MINUTOS_DEZ 
    MOV AL, COLUNA_DEZ
    MOV COLUNA, AL 
    JMP IMPRIMINDO
    RET  
    
LER_MIN_UNI:
    mov ah, 0
    mov al, 10H
    int 16h 
IMPRIME_MIN_UNI: 
    MOV MINUTOS_UNI, AL 
    MOV BL, MINUTOS_UNI
    LEA SI, MINUTOS_UNI 
    DEC LINHA
    ;INC COLUNA
    MOV AL, COLUNA_UNID
    MOV COLUNA, AL
    JMP IMPRIMINDO
    RET

VERIFICA_HORA:
    CMP SEGUNDOS_UNI, 10 
;SE SEG == 10, ZERA UNIDADE E INC DEZENA
    JE INCREMENTA_DEZ_SEG
    CMP SEGUNDOS_DEZ, 6  
;SE SEG == 6, ZERA DEZENA E INC UNI MIN
    JE INCREMENTA_UNI_MIN
    CMP MINUTOS_UNI, 10  
; SE MIN == 1O, ZERA UNIDADE E INC DEZENA
    JE INCREMENTA_DEZ_MIN
    CMP MINUTOS_DEZ, 6  
; SE MIN == 6, ZERA DEZENA E COMECA DNV
    JE COMECA_DE_NOVO   
    RET
    
    
INCREMENTA_DEZ_SEG: 
    MOV SEGUNDOS_UNI, 0 
    INC SEGUNDOS_DEZ  
    JMP VERIFICA_HORA
    
INCREMENTA_UNI_MIN:   
    MOV SEGUNDOS_DEZ, 0 
    INC MINUTOS_UNI
    JMP VERIFICA_HORA 
    
INCREMENTA_DEZ_MIN:
    MOV MINUTOS_UNI, 0
    INC MINUTOS_DEZ  
    JMP VERIFICA_HORA
    
COMECA_DE_NOVO:
    MOV MINUTOS_DEZ, 0
    JMP VERIFICA_HORA   
         
         

IMPRIMINDO:
    ; POSICIONA CURSOR
    MOV AH,2
    MOV BH,0
    MOV DH, LINHA
    MOV DL, COLUNA   
    INT 10H                     

PROCURA_FIM:
    mov dl,ds:[si]
    cmp dl,0
    je FIM_IMPRESSAO
    cmp dl,10
    je pula_linha
                 
VERIFICA_POSICAO:
    ;Verifica se o numero da dezena dos segundos esta sendo impressa         
    CMP NUMERO_ATUAL, 1  
    JE VERIFICA_COLUNA_DEZENA_SEGUNDOS
                                            
    CMP NUMERO_ATUAL, 2  
    JE VERIFICA_COLUNA_UNIDADE_SEGUNDOS
    
    CMP NUMERO_ATUAL, 3  
    JE VERIFICA_COLUNA_DEZENA_MINUTOS
                                            
    CMP NUMERO_ATUAL, 4  
    JE VERIFICA_COLUNA_UNIDADE_MINUTOS    
    
    
                                             
                                            
VERIFICA_COLUNA_DEZENA_SEGUNDOS:
    CMP COLUNA, 60 ; 40 (original) + 20 (tamanho limite de uma linha da arte ascii)
    JE PROXIMA_LINHA_DEZENA_SEGUNDOS    
    
    JMP IMPRIME_COM_COR
    
    
PROXIMA_LINHA_DEZENA_SEGUNDOS:
    MOV COLUNA, 40 ; retoma a posicao inicial da coluna    
    
    JMP IMPRIMINDO  
    
    
                             
                             
VERIFICA_COLUNA_UNIDADE_SEGUNDOS:
    CMP COLUNA, 80 ; 60 (original) + 20 (tamanho limite de uma linha da arte ascii)
    JE PROXIMA_LINHA_UNIDADE_SEGUNDOS    
    
    JMP IMPRIME_COM_COR
    
    
PROXIMA_LINHA_UNIDADE_SEGUNDOS:
    MOV COLUNA, 60 ; retoma a posicao inicial da coluna    
    
    JMP IMPRIMINDO
                                               
                           
                           
VERIFICA_COLUNA_DEZENA_MINUTOS:
    CMP COLUNA, 20 ; 0 (original) + 20 (tamanho limite de uma linha da arte ascii)
    JE PROXIMA_LINHA_DEZENA_MINUTOS    
    
    JMP IMPRIME_COM_COR
    
    
PROXIMA_LINHA_DEZENA_MINUTOS:
    MOV COLUNA, 0 ; retoma a posicao inicial da coluna    
    
    JMP IMPRIMINDO       
    
                         
                         
VERIFICA_COLUNA_UNIDADE_MINUTOS:
    CMP COLUNA, 40 ; 20 (original) + 20 (tamanho limite de uma linha da arte ascii)
    JE PROXIMA_LINHA_UNIDADE_MINUTOS    
    
    JMP IMPRIME_COM_COR
    
    
PROXIMA_LINHA_UNIDADE_MINUTOS:
    MOV COLUNA, 20 ; retoma a posicao inicial da coluna    
    
    JMP IMPRIMINDO
                              
             
IMPRIME_COM_COR:             
                 
    MOV AH,09H     ;write character and attribute at cursor position.   
    MOV AL, DL
    MOV BH, 0      ; Set page number 
    MOV CX, 1      ; Character count
    MOV BL, COLOR      ; Color    
    
    int 10h

    
    ;mov ah,2      VERSAO ANTIGA
    ;int 21h       The DOS function INT 21h which prints a string till the end-char does not care about the attribute passed 
                  ;to the BIOS function INT 10h, so the color is ignored by it 

    INC SI       
    INC COLUNA
    JMP IMPRIMINDO
   
pula_linha:
   
    inc byte ptr linha
    inc si         
    jmp IMPRIMINDO
                        
                             
                         
FIM_IMPRESSAO:
    RET    
    
VERIFICA_INPUT:
    
    CMP SEGUNDOS_DEZ, 35h  ;Verifica se o digito da dezena dos segundos e maior que 5
    JG REINICIA_RECEBIMENTO_ERRO   
    CMP SEGUNDOS_DEZ, 30h  ;Verifica se o digito da dezena dos segundos e menor do que 0 (no caso os caracteres sao invalidos)
    JL REINICIA_RECEBIMENTO_ERRO     

    CMP SEGUNDOS_UNI, 39h
    JG REINICIA_RECEBIMENTO_ERRO   
    CMP SEGUNDOS_UNI, 30h
    JL REINICIA_RECEBIMENTO_ERRO 
                                     
    CMP MINUTOS_DEZ, 35h
    JG REINICIA_RECEBIMENTO_ERRO 
    CMP MINUTOS_DEZ, 30h
    JL REINICIA_RECEBIMENTO_ERRO    
          
    CMP MINUTOS_UNI, 39h
    JG REINICIA_RECEBIMENTO_ERRO 
    CMP MINUTOS_UNI, 30h
    JL REINICIA_RECEBIMENTO_ERRO 
    RET    
 
    
DELAY_1_SEG:
    MOV CX, 0FH
    MOV DX, 4240H
    MOV AH, 86H
    INT 15H 
    RET    
    
TROCA_COR_DEZENA_SEGUNDOS:
    PUSHF
    PUSH AX
    
    MOV AL, DIGITO
    AND AL, 01h    ;Comparacao dos bits para checar se o numero eh impar 
    JZ EH_PAR_DEZENA_SEGUNDOS ;JUMPZERO = Se for 0, o numero e par 
    
    MOV COLOR, 5 
    JMP FIM_TROCA_COR

    
EH_PAR_DEZENA_SEGUNDOS:
    MOV COLOR, 3 
    JMP FIM_TROCA_COR      
    
                
                
    
TROCA_COR_UNIDADE_SEGUNDOS: 
    PUSHF
    PUSH AX
    MOV AL, DIGITO
    AND AL, 01h    ;Comparacao dos bits para checar se o numero eh impar 
    JZ EH_PAR_UNIDADE_SEGUNDOS ;JUMPZERO = Se for 0, o numero e par 
    
    MOV COLOR, 6 
    JMP FIM_TROCA_COR

    
EH_PAR_UNIDADE_SEGUNDOS:
    MOV COLOR, 4 
    JMP FIM_TROCA_COR   
                
                
                

TROCA_COR_DEZENA_MINUTOS: 
    PUSHF
    PUSH AX 
    MOV AL, DIGITO
    AND AL, 01h    ;Comparacao dos bits para checar se o numero eh impar 
    JZ EH_PAR_DEZENA_MINUTOS ;JUMPZERO = Se for 0, o numero e par 
    
    MOV COLOR, 7 
    JMP FIM_TROCA_COR

    
EH_PAR_DEZENA_MINUTOS:
    MOV COLOR, 9 
    JMP FIM_TROCA_COR      
    
    
    
TROCA_COR_UNIDADE_MINUTOS: 
    PUSHF
    PUSH AX
    MOV AL, DIGITO
    AND AL, 01h    ;Comparacao dos bits para checar se o numero eh impar 
    JZ EH_PAR_UNIDADE_SEGUNDOS ;JUMPZERO = Se for 0, o numero e par 
    
    MOV COLOR, 13 
    JMP FIM_TROCA_COR

    
EH_PAR_UNIDADE_MINUTOS:
    MOV COLOR, 15 
    JMP FIM_TROCA_COR  
                    
                    
FIM_TROCA_COR:
    POPF 
    POP AX
    RET
            
                   
ends

end start