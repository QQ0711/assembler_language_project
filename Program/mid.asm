.MODEL HUGE
.STACK 128
.DATA 
MAIN_STR DB '  ',0ah,0dh
  db   '                                                                    ',0ah,0dh
  db   '                                                                    ',0ah,0dh
  db   '                                                                    ',0ah,0dh
  db   '                                                                    ',0ah,0dh
  db   '                                                                    ',0ah,0dh
  db   '                                                                    ',0ah,0dh
  db   '                                                                    ',0ah,0dh
  DB   '                ====================================================',0ah,0dh
  DB   '               ||                                                  ||',0ah,0dh                                        
  DB   '               ||            *    Invoice  Check      *            ||',0ah,0dh
  DB   '               ||                                                  ||',0ah,0dh
  DB   '               ||--------------------------------------------------||',0ah,0dh
  DB   '               ||                                                  ||',0ah,0dh
  DB   '               ||   Author:                                        ||',0ah,0dh
  DB   '               ||                     1094841                      ||',0ah,0dh   
  DB   '               ||                    YU-YU, LEE                    ||',0ah,0dh
  DB   '               ||                     1094908                      ||',0ah,0dh
  DB   '               ||                   MEI-CHI, KO                    ||',0ah,0dh
  DB   '               ||                     1093332                      ||',0ah,0dh 
  DB   '               ||                 TUNG-CHUN, SHANG                 ||',0ah,0dh
  DB   '               ||                                                  ||',0ah,0dh
  DB   '                ====================================================',0ah,0dh
  DB   '$',0ah,0dh 
prompt_display db   'Please enter the following infomation:','$';請使用者輸入以下資訊的str
super_num_display db   'Super Number  :','$';提示使用者輸入當期特別獎的str
special_num_display db 'Special Number:','$';提示使用者輸入當期特獎的str
first_num1_display db  'First Number 1:','$';提示使用者輸入當期頭獎1的str
first_num2_display db  'First Number 2:','$';提示使用者輸入當期頭獎2的str
first_num3_display db  'First Number 3:','$';提示使用者輸入當期頭獎3的str
continueORquit db   'Continue(c) or Quit(q):','$';提示使用者輸入繼續或離開
super_num DB 9,?,9 DUP('$')   ;儲存特別獎號碼的陣列
special_num DB 9,?,9 DUP('$') ;儲存特獎號碼的陣列
first_num1 DB 9,?,9 DUP('$')  ;儲存頭獎號碼1的陣列
first_num2 DB 9,?,9 DUP('$')  ;儲存頭獎號碼2的陣列
first_num3 DB 9,?,9 DUP('$')  ;儲存頭獎號碼3的陣列
user_num DB 9,?,9 DUP('$')    ;儲存使用者的號碼的陣列
num_prompt_display db 'NUMBER: ','$' ;提示使用者輸入要對獎的號碼

super_str db 'Congratulations! You have won a super prize!!10,000,000!!.','$'    ;恭喜中特別獎的str
special_str db 'Congratulations! You have won a special prize!!2,000,000!!.','$' ;恭喜中特獎的str
first_str db 'Congratulations! You have won a first prize!!200,000!!.','$'       ;恭喜中頭獎的str
second_str db 'Congratulations! You have won a second prize!!40,000!!.','$'      ;恭喜中二獎的str
third_str db 'Congratulations! You have won a third prize!!10,000!!.','$'        ;恭喜中三獎的str
fourth_str db 'Congratulations! You have won a fourth prize!!4,000!!.','$'       ;恭喜中四獎的str
fifth_str db 'Congratulations! You have won a fifth prize!!1,000!!.','$'         ;恭喜中五獎的str
sixth_str db 'Congratulations! You have won a sixth prize!!200!!.','$'           ;恭喜中六獎的str
no_str db 'What a pity! You did not win any prize!!GOGO!!.','$'                  ;安慰沒中獎的str
result db 'RESULT:','$'                 ;RESULT的str，離開程式時輸出
result_super db 'Super Prize: ','$'     ;特別獎的str，離開程式時輸出
result_special db 'Special Prize: ','$' ;特獎的str，離開程式時輸出
result_first db 'First Prize: ','$'     ;頭獎的str，離開程式時輸出
result_second db 'Second Prize: ','$'   ;二獎的str，離開程式時輸出
result_third db 'Third Prize: ','$'     ;三獎的str，離開程式時輸出
result_fourth db 'Fourth Prize: ','$'   ;四獎的str，離開程式時輸出
result_fifth db 'Fifth Prize: ','$'     ;五獎的str，離開程式時輸出
result_sixth db 'Sixth Prize: ','$'     ;六獎的str，離開程式時輸出


; 以下音樂部分擷取至作業08的練習檔
; Do, Re, Mi, Fa, So, La, Si, Do
; 7個基本音

C1        EQU        11C4H                ; 1190000/261.63 (之16進位)
C2        EQU        0FD4H                ; 1190000/293.67 (之16進位)
C3        EQU        0E1AH                ; 1190000/329.63 (之16進位)
C4        EQU        0D50H                ; 1190000/349.23 (之16進位)
C5        EQU        0BDCH                ; 1190000/392.00 (之16進位)
C6        EQU        0A91H                ; 1190000/440.00 (之16進位)
C7        EQU        0969H                ; 1190000/493.89 (之16進位)
D1        EQU        08E2H                ; 1190000/(261.63*2) (之16進位)

; 曲目
MUSIC_ZHONG DW C1, C3, C5,00 ;顯示中獎時播放
MUSIC_POO DW D1, C7, C6,00   ;顯示大便(沒中獎)時播放
MUSIC_321 DW C1,00           ;顯示321(倒數)時播放


is_bingo DB 0       ;記錄當下的使用者號碼是否中獎(0:有，1：無)

;記錄個獎項的中獎次數
super_bingo DB 0    ;特別獎中了幾個
special_bingo DB 0  ;特獎中了幾個
first_bingo DB 0    ;頭獎中了幾個
second_bingo DB 0   ;二獎中了幾個
third_bingo DB 0    ;三獎中了幾個
fourth_bingo DB 0   ;四獎中了幾個
fifth_bingo DB 0    ;五獎中了幾個
sixth_bingo DB 0    ;六獎中了幾個

;顏色的代碼(繪圖用)
WHITE EQU 0fh
BLACK EQU 00h
RED EQU 04h
YELLOW EQU 0Eh
BROWN EQU 06h
gray EQU 07h
Dark_Gray EQU 08h
GREEN EQU 02H

.CODE
;主程式
main proc far
    ;將DATA的起始位置移到ds
    mov ax,@DATA
    mov ds,ax 
    
    ;call Enter_Info 進入程式開始頁面
    call Enter_Info
    
    ;READ CorQ (contiune or quit)
        ;移動游標到(row:7,col:29)
        MOV DL, 29
        MOV DH, 7
        MOV BH, 0
        MOV AH, 02h
        int 10h
        ;讀一個字元
        MOV AH,01H 
        INT 21H
        CMP AL, 'q' ;是否為q
        JE EXIT     ;是q的話就跳到EXIT
    
    ;程式的主要loop
    main_loop:
        ;INPUT_NUM會顯示使用者輸入頁面，請使用者輸入要對獎的號碼
        call INPUT_NUM   
        
        ;CHECK_NUM會檢查是否中獎：
        ;會將中獎結果return到AX
        ;  AX    類別
        ;-------------
        ;   0   特別獎
        ;   1    特獎
        ;   2    頭獎
        ;   3    二獎
        ;   4    三獎
        ;   5    四獎
        ;   6    五獎
        ;   7    六獎
        ;   8   沒中獎
        call CHECK_NUM 

        ;INC_RECORD會透過AX(AX要放中了什麼獎)，記錄目前中獎情況，將中的獎項的中獎數量+1
        call INC_RECORD 

        ;DISPLAY_BINGO 透過AX(AX要放中了什麼獎)與is_bingo，顯示動畫，揭曉有無中獎
        call DISPLAY_BINGO 

        ;SHOW continueORquit
            ;移動游標到(row:7,col:15)
            MOV DL, 15
            MOV DH, 7
            MOV BH, 0
            MOV AH, 02h
            int 10h
            ;印出字串continueORquit ('Continue(c) or Quit(q):')
            MOV AH,09
            MOV DH,0
            MOV DX,OFFSET continueORquit
            INT 21H

        ;READ CorQ (contiune or quit)
            ;移動游標到(row:7,col:39)
            MOV DL, 39
            MOV DH, 7
            MOV BH, 0
            MOV AH, 02h
            int 10h
            ;讀一個字元
            MOV AH,01H 
            INT 21H
            CMP AL, 'q' ;是否為q
            JE EXIT     ;是q的話就跳到EXIT

        jmp main_loop  ;繼續下一個loop

    EXIT:
        ; DISPLAY_RESULT會顯示中獎的總結果
        CALL DISPLAY_RESULT
        ; 結束程式
        mov ah,4ch
        int 21h 
        hlt
main ENDP

DISPLAY_RESULT proc near
    ;DISPLAY_RESULT會顯示中獎的總結果
    
    ;將螢幕清空
    MOV AX, 0600H
    MOV BH, 7
    MOV CX, 0
    MOV DX ,184FH
    INT 10H

    ;移動游標到(row:0,col:0)
    MOV DL, 0 ;col
    MOV DH, 0 ;row        
    MOV BH, 0
    MOV AH, 02h
    int 10h
    ;印出字串result
    MOV AH,09
    MOV DH,0
    MOV DX,OFFSET result
    INT 21H
    
    ;印特別獎的結果
    PRINT_SUPER_RESULT:
        ;移動游標到(row:1,col:0)
        MOV DL, 0 ;col
        MOV DH, 1 ;row        
        MOV BH, 0
        MOV AH, 02h
        int 10h
        ;print 文字
        MOV AH,09
        MOV DH,0
        MOV DX,OFFSET result_super
        INT 21H
        ;print 中獎的數量
        mov dl, super_bingo     ; 要印出的數字
        add dl, 30h   ; 將數字轉換為 ASCII 字元
        mov ah, 02h   ; AH = 02h 代表印出字元
        int 21h       

    ;印特獎的結果
    PRINT_SPECIAL_RESULT:
        ;移動游標到(row:2,col:0)
        MOV DL, 0 ;col
        MOV DH, 2 ;row        
        MOV BH, 0
        MOV AH, 02h
        int 10h
        ;print 文字
        MOV AH,09
        MOV DH,0
        MOV DX,OFFSET result_special
        INT 21H
        ;print 中獎的數量
        mov dl, special_bingo     ; 要印出的數字
        add dl, 30h   ; 將數字轉換為 ASCII 字元
        mov ah, 02h   ; AH = 02h 代表印出字元
        int 21h
    
    ;印頭獎的結果
    PRINT_FIRST_RESULT:
        ;移動游標到(row:3,col:0)
        MOV DL, 0 ;col
        MOV DH, 3 ;row        
        MOV BH, 0
        MOV AH, 02h
        int 10h
        ;print 文字
        MOV AH,09
        MOV DH,0
        MOV DX,OFFSET result_first
        INT 21H
        ;print 中獎的數量
        mov dl, first_bingo     ; 要印出的數字
        add dl, 30h   ; 將數字轉換為 ASCII 字元
        mov ah, 02h   ; AH = 02h 代表印出字元
        int 21h

    ;印二獎的結果
    PRINT_SECOND_RESULT:
        ;移動游標到(row:4,col:0)
        MOV DL, 0 ;col
        MOV DH, 4 ;row        
        MOV BH, 0
        MOV AH, 02h
        int 10h
        ;print 文字
        MOV AH,09
        MOV DH,0
        MOV DX,OFFSET result_second
        INT 21H
        ;print 中獎的數量
        mov dl, second_bingo     ; 要印出的數字
        add dl, 30h   ; 將數字轉換為 ASCII 字元
        mov ah, 02h   ; AH = 02h 代表印出字元
        int 21h

    ;印三獎的結果
    PRINT_THIRD_RESULT:
        ;移動游標到(row:5,col:0)
        MOV DL, 0 ;col
        MOV DH, 5 ;row        
        MOV BH, 0
        MOV AH, 02h
        int 10h
        ;print 文字
        MOV AH,09
        MOV DH,0
        MOV DX,OFFSET result_third
        INT 21H
        ;print 中獎的數量
        mov dl, third_bingo     ; 要印出的數字
        add dl, 30h   ; 將數字轉換為 ASCII 字元
        mov ah, 02h   ; AH = 02h 代表印出字元
        int 21h
    
    ;印四獎的結果
    PRINT_FOURTH_RESULT:
        ;移動游標到(row:6,col:0)
        MOV DL, 0 ;col
        MOV DH, 6 ;row        
        MOV BH, 0
        MOV AH, 02h
        int 10h
        ;print 文字
        MOV AH,09
        MOV DH,0
        MOV DX,OFFSET result_fourth
        INT 21H
        ;print 中獎的數量
        mov dl, fourth_bingo     ; 要印出的數字
        add dl, 30h   ; 將數字轉換為 ASCII 字元
        mov ah, 02h   ; AH = 02h 代表印出字元
        int 21h

    ;印五獎的結果
    PRINT_FIFTH_RESULT:
        ;移動游標到(row:7,col:0)
        MOV DL, 0 ;col
        MOV DH, 7 ;row        
        MOV BH, 0
        MOV AH, 02h
        int 10h
        ;print 文字
        MOV AH,09
        MOV DH,0
        MOV DX,OFFSET result_fifth
        INT 21H
        ;print 中獎的數量
        mov dl, fifth_bingo     ; 要印出的數字
        add dl, 30h   ; 將數字轉換為 ASCII 字元
        mov ah, 02h   ; AH = 02h 代表印出字元
        int 21h
    
    ;印六獎的結果
    PRINT_SIXTH_RESULT:
        ;移動游標到(row:8,col:0)
        MOV DL, 0 ;col
        MOV DH, 8 ;row        
        MOV BH, 0
        MOV AH, 02h
        int 10h
        ;print 文字
        MOV AH,09
        MOV DH,0
        MOV DX,OFFSET result_sixth
        INT 21H
        ;print 中獎的數量
        mov dl, sixth_bingo     ; 要印出的數字
        add dl, 30h   ; 將數字轉換為 ASCII 字元
        mov ah, 02h   ; AH = 02h 代表印出字元
        int 21h
    RET
DISPLAY_RESULT ENDP

DRAW_BACKGROUND proc near
    ;DRAW_BACKGROUND 會將背景塗成指定的顏色
    ;CALL之前要在AL放入想要的背景顏色

    ;將x=320~0，y=200~0都上色(螢幕為320*200)
        MOV BH,0
        MOV CX,320D         ;指定從x=320開始畫
        MOV AH,0Ch
        BG_X:
            MOV DX,200D     ;指定從y=200開始畫
            BG_Y:
                INT 10H
                DEC DX
                CMP DX, -1  ;y畫到0 
                JE BG_Y_OUT
            JNZ BG_Y
            BG_Y_OUT:
        LOOP BG_X           ;x畫到0
    RET
DRAW_BACKGROUND ENDP

DRAW_POO proc near
    ;DRAW_POO會畫大便並發出音效

    ;大便 的 第1個筆劃(長方形)
        MOV BH,0
        MOV CX,230D             ;指定從x=230開始畫
        MOV AH,0Ch
        MOV AL,BROWN
        POO_1_X:
            MOV DX,185D         ;指定從y=185開始畫
            POO_1_Y:
                INT 10H
                DEC DX
                CMP DX, 164     ;y畫到165
                JE POO_1_Y_OUT
                JMP POO_1_Y
            POO_1_Y_OUT:
            DEC CX
            CMP CX, 89          ;x畫到90
            JNE POO_1_X  
    
    ;大便 的 第2個筆劃(長方形)
        MOV BH,0
        MOV CX,210D             ;指定從x=210開始畫
        MOV AH,0Ch
        MOV AL,BROWN
        POO_2_X:
            MOV DX,162D         ;指定從y=162開始畫
            POO_2_Y:
                INT 10H
                DEC DX
                CMP DX, 139     ;y畫到140
                JE POO_2_Y_OUT
                JMP POO_2_Y
            POO_2_Y_OUT:
            DEC CX
            CMP CX, 109         ;x畫到110
            JNE POO_2_X
    
    ;大便 的 第3個筆劃(長方形)
        MOV BH,0
        MOV CX,175D             ;指定從x=175開始畫
        MOV AH,0Ch
        MOV AL,BROWN
        POO_3_X:
            MOV DX,137D         ;指定從y=137開始畫
            POO_3_Y:
                INT 10H
                DEC DX
                CMP DX, 119     ;y畫到120
                JE POO_3_Y_OUT
                JMP POO_3_Y
            POO_3_Y_OUT:
            DEC CX
            CMP CX, 144         ;x畫到145
            JNE POO_3_X

    ;大便 的 第4個筆劃(長方形)
        MOV BH,0
        MOV CX,95D              ;指定從x=95開始畫
        MOV AH,0Ch
        MOV AL,GRAY
        POO_4_X:
            MOV DX,110D         ;指定從y=110開始畫
            POO_4_Y:
                INT 10H
                DEC DX
                CMP DX, 69      ;y畫到70
                JE POO_4_Y_OUT
                JMP POO_4_Y
            POO_4_Y_OUT:
            DEC CX
            CMP CX, 89          ;x畫到90
            JNE POO_4_X

        ;大便 的 第5個筆劃(長方形)
        MOV BH,0
        MOV CX,100D             ;指定從x=100開始畫
        MOV AH,0Ch
        MOV AL,GRAY
        POO_5_X:
            MOV DX,80D          ;指定從y=80開始畫
            POO_5_Y:
                INT 10H
                DEC DX
                CMP DX, 59      ;y畫到60
                JE POO_5_Y_OUT
                JMP POO_5_Y
            POO_5_Y_OUT:
            DEC CX
            CMP CX, 94          ;x畫到95
            JNE POO_5_X

        ;大便 的 第6個筆劃(長方形)
        MOV BH,0
        MOV CX,230D             ;指定從x=230開始畫
        MOV AH,0Ch
        MOV AL,GRAY
        POO_6_X:
            MOV DX,100D         ;指定從y=100開始畫
            POO_6_Y:
                INT 10H
                DEC DX
                CMP DX, 69      ;y畫到70
                JE POO_6_Y_OUT
                JMP POO_6_Y
            POO_6_Y_OUT:
            DEC CX
            CMP CX, 224         ;x畫到225
            JNE POO_6_X
        
        ;大便 的 第7個筆劃(長方形)
        MOV BH,0
        MOV CX,225D             ;指定從x=225開始畫
        MOV AH,0Ch
        MOV AL,GRAY
        POO_7_X:
            MOV DX,80D         ;指定從y=80開始畫
            POO_7_Y:
                INT 10H
                DEC DX
                CMP DX, 49      ;y畫到50
                JE POO_7_Y_OUT
                JMP POO_7_Y
            POO_7_Y_OUT:
            DEC CX
            CMP CX, 219         ;x畫到220
            JNE POO_7_X

        ;大便 的 第8個筆劃(長方形)
        MOV BH,0
        MOV CX,163D             ;指定從x=163開始畫
        MOV AH,0Ch
        MOV AL,GRAY
        POO_8_X:
            MOV DX,60D          ;指定從y=60開始畫
            POO_8_Y:
                INT 10H
                DEC DX
                CMP DX, 19      ;y畫到20
                JE POO_8_Y_OUT
                JMP POO_8_Y
            POO_8_Y_OUT:
            DEC CX
            CMP CX, 157         ;x畫到158
            JNE POO_8_X
        
        ;大便 的 第9個筆劃(長方形)
        MOV BH,0
        MOV CX,168D             ;指定從x=168開始畫
        MOV AH,0Ch
        MOV AL,GRAY
        POO_9_X:
            MOV DX,80D          ;指定從y=80開始畫
            POO_9_Y:
                INT 10H
                DEC DX
                CMP DX, 44      ;y畫到45
                JE POO_9_Y_OUT
                JMP POO_9_Y
            POO_9_Y_OUT:
            DEC CX
            CMP CX, 162         ;x畫到163
            JNE POO_9_X
        
        ;大便 的 第10個筆劃(長方形)
        MOV BH,0
        MOV CX,163D             ;指定從x=163開始畫
        MOV AH,0Ch
        MOV AL,GRAY
        POO_10_X:
            MOV DX,90D          ;指定從y=90開始畫
            POO_10_Y:
                INT 10H
                DEC DX
                CMP DX, 69      ;y畫到70
                JE POO_10_Y_OUT
                JMP POO_10_Y
            POO_10_Y_OUT:
            DEC CX
            CMP CX, 157         ;x畫到158
            JNE POO_10_X
    ; 以下為播放音效的程式碼(擷取至作業8的範例檔)
        IN AL, 61H                ; OPEN SPEAKER
        OR AL, 00000011B
        OUT 61H, AL
        MOV BX, OFFSET MUSIC_POO ; SET INITIAL MUSIC POINTER IN BX

        SOUND_POO:  
            MOV DX, DS:[BX]        ; GET SOUND FREQUENCY IN DX
            CMP DX,0                ; CHECK END
            JZ SOUND_POO_EXIT              
            MOV SI, 500H  ;SI設定為音的長度
            CALL PLAY_MUSIC                ; CALL PLAY PROCEDURE
            ADD BX,2                ; INCREASE BX POINTER BY 2
            JMP SOUND_POO               ; AGAIN

        SOUND_POO_EXIT:   
        IN AL, 61H                ; CLOSE SPEAKER
        AND AL, 11111100B
        OUT 61H, AL

    RET
DRAW_POO ENDP

DRAW_ZHONG proc near
    ;DRAW_ZHONG會畫中並發出音效

    ;中 的 第一個筆劃(長方形)
        MOV BH,0
        MOV CX,230D                ;指定從x=230開始畫
        MOV AH,0Ch
        ZHONG_1_X:
            MOV DX,50D             ;指定從y=50開始畫
            ZHONG_1_Y:
                INT 10H
                DEC DX
                CMP DX, 39         ;y畫到40
                JE ZHONG_1_Y_OUT
                JMP ZHONG_1_Y
            ZHONG_1_Y_OUT:
            DEC CX
            CMP CX, 89             ;x畫到90
            JNE ZHONG_1_X
        
        ;中 的 第二個筆劃(長方形)
        MOV BH,0
        MOV CX,230D                ;指定從x=230開始畫
        MOV AH,0Ch
        ZHONG_2_X:
            MOV DX,110D            ;指定從y=110開始畫
            ZHONG_2_Y:
                INT 10H
                DEC DX
                CMP DX, 99         ;y畫到100
                JE ZHONG_2_Y_OUT
                JMP ZHONG_2_Y
            ZHONG_2_Y_OUT:
            DEC CX
            CMP CX, 89             ;x畫到90
            JNE ZHONG_2_X
        
        ;中 的 第三個筆劃(長方形)
        MOV BH,0
        MOV CX,110D                ;指定從x=110開始畫
        MOV AH,0Ch
        ZHONG_3_X:
            MOV DX,100D            ;指定從y=100開始畫
            ZHONG_3_Y:
                INT 10H
                DEC DX
                CMP DX, 49         ;y畫到50
                JE ZHONG_3_Y_OUT
                JMP ZHONG_3_Y
            ZHONG_3_Y_OUT:
            DEC CX
            CMP CX, 89             ;x畫到90
            JNE ZHONG_3_X

        ;中 的 第四個筆劃(長方形)
        MOV BH,0
        MOV CX,230D                ;指定從x=230開始畫
        MOV AH,0Ch
        ZHONG_4_X:
            MOV DX,100D            ;指定從y=100開始畫
            ZHONG_4_Y:
                INT 10H
                DEC DX
                CMP DX, 49         ;y畫到50
                JE ZHONG_4_Y_OUT
                JMP ZHONG_4_Y
            ZHONG_4_Y_OUT:
            DEC CX
            CMP CX, 209             ;x畫到210
            JNE ZHONG_4_X
        
        ;中 的 第五個筆劃(長方形)
        MOV BH,0
        MOV CX,165D                ;指定從x=165開始畫
        MOV AH,0Ch
        ZHONG_5_X:
            MOV DX,185D            ;指定從y=185開始畫
            ZHONG_5_Y:
                INT 10H
                DEC DX
                CMP DX, 14         ;y畫到15
                JE ZHONG_5_Y_OUT
                JMP ZHONG_5_Y
            ZHONG_5_Y_OUT:
            DEC CX
            CMP CX, 154            ;x畫到155
            JNE ZHONG_5_X
    
    ; 以下為播放音效的程式碼(擷取至作業8的範例檔)
        IN AL, 61H                ; OPEN SPEAKER
        OR AL, 00000011B
        OUT 61H, AL
        MOV BX, OFFSET MUSIC_ZHONG ; SET INITIAL MUSIC POINTER IN BX

        SOUND_ZHONG:  
            MOV DX, DS:[BX]        ; GET SOUND FREQUENCY IN DX
            CMP DX,0                ; CHECK END
            JZ SOUND_ZHONG_EXIT              
            MOV SI, 500H  ;SI設定為音的長度
            CALL PLAY_MUSIC                ; CALL PLAY PROCEDURE
            ADD BX,2                ; INCREASE BX POINTER BY 2
            JMP SOUND_ZHONG              ; AGAIN

        SOUND_ZHONG_EXIT:   
        IN AL, 61H                ; CLOSE SPEAKER
        AND AL, 11111100B
        OUT 61H, AL

    RET
DRAW_ZHONG ENDP

DRAW_ONE proc near
        ;1 的 第一個筆劃(長方形)
        MOV BH,0
        MOV CX,165D               ;指定從x=165開始畫
        MOV AH,0Ch
        MOV AL,BLACK
        ONE_1_X:
            MOV DX,185D           ;指定從y=185開始畫
            ONE_1_Y:
                INT 10H
                DEC DX
                CMP DX, 14        ;y畫到15
                JE ONE_1_Y_OUT
                JMP ONE_1_Y
            ONE_1_Y_OUT:
            DEC CX
            CMP CX, 154           ;x畫到155
            JNE ONE_1_X
    
    ; 以下為播放音效的程式碼(擷取至作業8的範例檔)
        IN AL, 61H                ; OPEN SPEAKER
        OR AL, 00000011B
        OUT 61H, AL
        MOV BX, OFFSET MUSIC_321 ; SET INITIAL MUSIC POINTER IN BX

        SOUND1:  
            MOV DX, DS:[BX]        ; GET SOUND FREQUENCY IN DX
            CMP DX,0                ; CHECK END
            JZ SOUND1_EXIT              
            MOV SI, 1000H  ;SI設定為音的長度
            CALL PLAY_MUSIC                ; CALL PLAY PROCEDURE
            ADD BX,2                ; INCREASE BX POINTER BY 2
            JMP SOUND1               ; AGAIN

        SOUND1_EXIT:   
        IN AL, 61H                ; CLOSE SPEAKER
        AND AL, 11111100B
        OUT 61H, AL

    RET
DRAW_ONE ENDP

DRAW_TWO proc near
        ;2 的 第一個筆劃(長方形)
        MOV BH,0
        MOV CX,220D              ;指定從x=220開始畫
        MOV AH,0Ch
        MOV AL,BLACK
        TWO_1_X:
            MOV DX,25D           ;指定從y=25開始畫
            TWO_1_Y:
                INT 10H
                DEC DX
                CMP DX, 14       ;y畫到15
                JE TWO_1_Y_OUT
                JMP TWO_1_Y
            TWO_1_Y_OUT:
            DEC CX
            CMP CX, 89           ;x畫到90
            JNE TWO_1_X
        
        ;2 的 第二個筆劃(長方形)
        MOV BH,0
        MOV CX,220D              ;指定從x=220開始畫
        MOV AH,0Ch
        MOV AL,BLACK
        TWO_2_X:
            MOV DX,105D          ;指定從y=105開始畫
            TWO_2_Y:
                INT 10H
                DEC DX
                CMP DX, 94       ;y畫到95
                JE TWO_2_Y_OUT
                JMP TWO_2_Y
            TWO_2_Y_OUT:
            DEC CX
            CMP CX, 89           ;x畫到90
            JNE TWO_2_X
        
        ;2 的 第三個筆劃(長方形)
        MOV BH,0
        MOV CX,220D              ;指定從x=220開始畫
        MOV AH,0Ch
        MOV AL,BLACK
        TWO_3_X:
            MOV DX,185D          ;指定從y=185開始畫
            TWO_3_Y:
                INT 10H
                DEC DX
                CMP DX, 174      ;y畫到175
                JE TWO_3_Y_OUT
                JMP TWO_3_Y
            TWO_3_Y_OUT:
            DEC CX
            CMP CX, 89           ;x畫到90
            JNE TWO_3_X

        ;2 的 第四個筆劃(長方形)
        MOV BH,0
        MOV CX,220D              ;指定從x=220開始畫
        MOV AH,0Ch
        MOV AL,BLACK
        TWO_4_X:
            MOV DX,95D           ;指定從y=95開始畫
            TWO_4_Y:
                INT 10H
                DEC DX
                CMP DX, 24       ;y畫到25
                JE TWO_4_Y_OUT
                JMP TWO_4_Y
            TWO_4_Y_OUT:
            DEC CX
            CMP CX, 209          ;x畫到210
            JNE TWO_4_X
        
        ;2 的 第五個筆劃(長方形)
        MOV BH,0
        MOV CX,100D              ;指定從x=100開始畫
        MOV AH,0Ch
        MOV AL,BLACK
        TWO_5_X:
            MOV DX,175D          ;指定從y=175開始畫
            TWO_5_Y:
                INT 10H
                DEC DX
                CMP DX, 104      ;y畫到105
                JE TWO_5_Y_OUT
                JMP TWO_5_Y
            TWO_5_Y_OUT:
            DEC CX
            CMP CX, 89           ;x畫到90
            JNE TWO_5_X
    
    ; 以下為播放音效的程式碼(擷取至作業8的範例檔)
        IN AL, 61H                ; OPEN SPEAKER
        OR AL, 00000011B
        OUT 61H, AL
        MOV BX, OFFSET MUSIC_321 ; SET INITIAL MUSIC POINTER IN BX

        SOUND2:  
            MOV DX, DS:[BX]        ; GET SOUND FREQUENCY IN DX
            CMP DX,0                ; CHECK END
            JZ SOUND2_EXIT              
            MOV SI, 1000H  ;SI設定為音的長度
            CALL PLAY_MUSIC                ; CALL PLAY PROCEDURE
            ADD BX,2                ; INCREASE BX POINTER BY 2
            JMP SOUND2               ; AGAIN

        SOUND2_EXIT:   
        IN AL, 61H                ; CLOSE SPEAKER
        AND AL, 11111100B
        OUT 61H, AL

    RET
DRAW_TWO ENDP

DRAW_THREE proc near
        ;3 的 第一個筆劃(長方形)
        MOV BH,0
        MOV CX,220D               ;指定從x=220開始畫
        MOV AH,0Ch
        ;MOV AL,BLACK
        THREE_1_X:
            MOV DX,25D            ;指定從y=25開始畫
            THREE_1_Y:
                INT 10H
                DEC DX
                CMP DX, 14        ;y畫到15
                JE THREE_1_Y_OUT
                JMP THREE_1_Y
            THREE_1_Y_OUT:
            DEC CX
            CMP CX, 89            ;x畫到90
            JNE THREE_1_X
        
        ;3 的 第二個筆劃(長方形)
        MOV BH,0
        MOV CX,220D               ;指定從x=220開始畫
        MOV AH,0Ch
        ;MOV AL,BLACK
        THREE_2_X:
            MOV DX,105D           ;指定從y=105開始畫
            THREE_2_Y:
                INT 10H
                DEC DX
                CMP DX, 94        ;y畫到95
                JE THREE_2_Y_OUT
                JMP THREE_2_Y
            THREE_2_Y_OUT:
            DEC CX
            CMP CX, 89            ;x畫到90
            JNE THREE_2_X
        
        ;3 的 第三個筆劃(長方形)
        MOV BH,0
        MOV CX,220D               ;指定從x=220開始畫
        MOV AH,0Ch
        ;MOV AL,BLACK
        THREE_3_X:
            MOV DX,185D           ;指定從y=185開始畫
            THREE_3_Y:
                INT 10H
                DEC DX
                CMP DX, 174        ;y畫到175
                JE THREE_3_Y_OUT
                JMP THREE_3_Y
            THREE_3_Y_OUT:
            DEC CX
            CMP CX, 89            ;x畫到90
            JNE THREE_3_X

        ;3 的 第四個筆劃
        MOV BH,0
        MOV CX,230D                ;指定從x=230開始畫
        MOV AH,0Ch
        ;MOV AL,BLACK
        THREE_4_X:
            MOV DX,185D            ;指定從y=185開始畫
            THREE_4_Y:
                INT 10H
                DEC DX
                CMP DX, 14         ;y畫到15
                JE THREE_4_Y_OUT
                JMP THREE_4_Y
            THREE_4_Y_OUT:
            DEC CX
            CMP CX, 219            ;x畫到220
            JNE THREE_4_X
    
    ; 以下為播放音效的程式碼(擷取至作業8的範例檔)
        IN AL, 61H                ; OPEN SPEAKER
        OR AL, 00000011B
        OUT 61H, AL
        MOV BX, OFFSET MUSIC_321 ; SET INITIAL MUSIC POINTER IN BX

        SOUND3:  
            MOV DX, DS:[BX]        ; GET SOUND FREQUENCY IN DX
            CMP DX,0                ; CHECK END
            JZ SOUND3_EXIT              
            MOV SI, 1000H  ;SI設定為音的長度
            CALL PLAY_MUSIC                ; CALL PLAY PROCEDURE
            ADD BX,2                ; INCREASE BX POINTER BY 2
            JMP SOUND3               ; AGAIN

        SOUND3_EXIT:   
        IN AL, 61H                ; CLOSE SPEAKER
        AND AL, 11111100B
        OUT 61H, AL

    RET
DRAW_THREE ENDP

DISPLAY_BINGO proc near
    ;DISPLAY_BINGO 透過AX(AX要放中了什麼獎)與is_bingo，顯示動畫，揭曉有無中獎
    ;CALL之前要在AX放入中獎資訊

    ;先把存有中獎資訊的AX push到stack，等等再使用
    push AX
    ;將DATA的起始位置移到ds
    mov ax, @data
    mov ds, ax

    ; 設定顯示模式為 VGA 320x200 256色模式
    mov ax, 13h
    int 10h

    ;畫白底黑3
    MOV AL,WHITE
    CALL DRAW_BACKGROUND
    MOV AL,BLACK
    CALL DRAW_THREE
    
    ;畫白底黑2
    MOV AL,WHITE
    CALL DRAW_BACKGROUND
    MOV AL,BLACK
    CALL DRAW_TWO
    
    ;畫白底黑1
    MOV AL,WHITE
    CALL DRAW_BACKGROUND
    MOV AL,BLACK
    CALL DRAW_ONE
    
    CMP is_bingo,0
    JE DISPLAY_NO_BINGO

    ;有中獎就畫三個不一樣的中
    MOV AL,RED
    CALL DRAW_BACKGROUND
    MOV AL,WHITE
    CALL DRAW_ZHONG
    MOV AL,WHITE
    CALL DRAW_BACKGROUND
    MOV AL,RED
    CALL DRAW_ZHONG
    MOV AL,RED
    CALL DRAW_BACKGROUND
    MOV AL,WHITE
    CALL DRAW_ZHONG
    JMP EXIT_DISPLAY

    ;沒中獎就畫三個不一樣的大便
    DISPLAY_NO_BINGO:
        MOV AL,BLACK
        CALL DRAW_BACKGROUND
        CALL DRAW_POO
        MOV AL,Dark_Gray
        CALL DRAW_BACKGROUND
        CALL DRAW_POO
        MOV AL,BLACK
        CALL DRAW_BACKGROUND
        CALL DRAW_POO
    
    EXIT_DISPLAY:
        ; 還原為文字模式
        mov ax, 3h
        int 10h

    ;清空螢幕
    MOV AX, 0600H
    MOV BH, 7
    MOV CX, 0
    MOV DX ,184FH
    INT 10H

    ;移動游標到(row=0,col=0)
    MOV DL, 0 ;col
    MOV DH, 0 ;row        
    MOV BH, 0
    MOV AH, 02h
    int 10h

    ;print main_str
    MOV AH,09
    MOV DH,0
    MOV DX,OFFSET MAIN_STR
    INT 21H 

    ;移動游標到(row=5,col=15)
    MOV DL, 15 ;col
    MOV DH, 5 ;row
    MOV BH, 0
    MOV AH, 02h
    int 10h
    
    ;印出使用者輸入號碼是哪個獎(用AX來比對中什麼獎)
    PRINT_RESULT:
        POP AX           ;將AX POP出來比較
        CMP AX, 0
        JNE PRINT_SPECIAL
        ;印出中特別獎
        PRINT_SUPER:
            MOV AH,09
            MOV DH,0
            MOV DX, OFFSET super_str
            INT 21H
            RET
        ;印出中特獎
        PRINT_SPECIAL:
            CMP AX,1
            JNE PRINT_FIRST
            MOV AH,09
            MOV DH,0
            MOV DX, OFFSET special_str
            INT 21H
            RET
        ;印出中頭獎
        PRINT_FIRST:
            CMP AX,2
            JNE PRINT_SECOND
            MOV AH,09
            MOV DH,0
            MOV DX, OFFSET first_str
            INT 21H
            RET
        ;印出中二獎
        PRINT_SECOND:
            CMP AX,3
            JNE PRINT_THIRD
            MOV AH,09
            MOV DH,0
            MOV DX, OFFSET second_str
            INT 21H
            RET
        ;印出中三獎
        PRINT_THIRD:
            CMP AX,4
            JNE PRINT_FOURTH
            MOV AH,09
            MOV DH,0
            MOV DX, OFFSET third_str
            INT 21H
            RET
        ;印出中四獎
        PRINT_FOURTH:
            CMP AX,5
            JNE PRINT_FIFTH
            MOV AH,09
            MOV DH,0
            MOV DX, OFFSET fourth_str
            INT 21H
            RET
        ;印出中五獎
        PRINT_FIFTH:
            CMP AX,6
            JNE PRINT_SIXTH
            MOV AH,09
            MOV DH,0
            MOV DX, OFFSET fifth_str
            INT 21H
            RET
        ;印出中六獎
        PRINT_SIXTH:
            CMP AX,7
            JNE PRINT_NO
            MOV AH,09
            MOV DH,0
            MOV DX, OFFSET sixth_str
            INT 21H
            RET
        ;印出沒中獎
        PRINT_NO:
            MOV AH,09
            MOV DH,0
            MOV DX, OFFSET no_str
            INT 21H
            RET
    RET
DISPLAY_BINGO ENDP

INC_RECORD proc near
    ;INC_RECORD會透過AX(AX要放中了什麼獎)，記錄目前中獎情況，將中的獎項的中獎數量+1
    CMP AX, 0
    JNE INC_SPECIAL
    ;將特別獎+1
    INC_SUPER:
        ADD super_bingo, 1
        RET
    ;將特獎+1
    INC_SPECIAL:
        CMP AX,1
        JNE INC_FIRST
        ADD special_bingo, 1
        RET
    ;將頭獎+1
    INC_FIRST:
        CMP AX,2
        JNE INC_SECOND
        ADD first_bingo, 1
        RET
    ;將二獎+1
    INC_SECOND:
        CMP AX,3
        JNE INC_THIRD
        ADD second_bingo, 1
        RET
    ;將三獎+1
    INC_THIRD:
        CMP AX,4
        JNE INC_FOURTH
        ADD third_bingo, 1
        RET
    ;將四獎+1
    INC_FOURTH:
        CMP AX,5
        JNE INC_FIFTH
        ADD fourth_bingo, 1
        RET
    ;將五獎+1
    INC_FIFTH:
        CMP AX,6
        JNE INC_SIXTH
        ADD fifth_bingo, 1
        RET
    ;將六獎+1
    INC_SIXTH:
        CMP AX,7
        JNE EXIT_INC
        ADD sixth_bingo, 1
        RET
    EXIT_INC:
        RET
INC_RECORD ENDP


CHECK_OTHERS proc near
    ;CHECK_OTHERS用來比對倒數7個字元是否符合，檢查是否中二獎、三獎、四獎、五獎、六獎或沒中獎
    ;CALL 之前 SI 要放頭獎號碼的起始位址
    ;CALL 之前 DI 要放使用者號碼的起始位址

    mov DX, 0         ;用來計倒數幾個數字有與頭獎號碼一樣(EX:六獎為倒數三個符合)
    mov CX, 8         ;發票號碼共八個字元
    add SI, 9         ;跳到頭獎號碼的最後一個字開始比較
    add DI, 9         ;跳到使用者號碼的最後一個字開始比較
    loop_begin:
        MOV AL, [SI]
        CMP AL, [DI]
        JNE OUTSIDE   ;字元不一樣，就跳出
        INC DX        ;字元一樣，就將DX+1
        DEC SI        ;-1，往前比較前一個字元
        DEC DI        ;-1，往前比較前一個字元
    loop loop_begin
    OUTSIDE:
        CMP DX, 2     
        JBE DONE        ;假如DX小於等於2，表示沒中獎，就跳出
        mov is_bingo,1  ;有中獎
        mov AX,10
        SUB AX,DX ;10-DX=AX，AX會設定為3(二獎)、4(三獎)、5(四獎)、6(五獎)或 7(六獎)
    DONE:
        RET 
CHECK_OTHERS ENDP

CHECK_ALL proc near
    ;CHECK_OTHERS用來比對所有的字元，檢查是否中特別獎、特獎、頭獎
    ;CALL 之前 SI 要放特別獎、特獎或頭獎號碼的起始位址
    ;CALL 之前 DI 要放使用者號碼的起始位址

    mov CX, 8   ;發票號碼共八個字元
    ADD SI, 2   ;跳到號碼的起始位址
    ADD DI, 2   ;跳到號碼的起始位址

    loop_start:
        MOV AL, [SI]
        CMP AL, [DI]
        JNE NOT_MATCH ;字元不一樣，就跳出
        INC SI        ;+1，比對下一個字元
        INC DI        ;+1，比對下一個字元
    loop loop_start
    MATCH:
        mov is_bingo, 1    ;有中獎
    NOT_MATCH:
        RET
CHECK_ALL ENDP

CHECK_NUM proc near
    ;CHECK_NUM會檢查是否中獎：
        ;會將中獎結果return到AX
        ;  AX    類別
        ;-------------
        ;   0   特別獎
        ;   1    特獎
        ;   2    頭獎
        ;   3    二獎
        ;   4    三獎
        ;   5    四獎
        ;   6    五獎
        ;   7    六獎
        ;   8   沒中獎


    ;先歸零，0為沒中獎，1為有
    mov is_bingo,0 
    
    CHECK_SUPER:
        ;check 是否為特別獎
        mov SI, offset super_num  ;SI 放特別獎號碼的起始位址
        mov DI, offset user_num   ;DI 放使用者號碼的起始位址
        ;CHECK_OTHERS用來比對所有的字元，檢查是否中特別獎、特獎、頭獎
        call CHECK_ALL

        cmp is_bingo, 1
        JNE CHECK_SPECIAL   ;沒中獎就往下再檢查
        mov AX,0 ;0為特別獎中獎
        RET

    CHECK_SPECIAL:
        ;check 是否為特獎
        mov SI, offset special_num  ;SI 放特獎號碼的起始位址
        mov DI, offset user_num     ;DI 放使用者號碼的起始位址
        ;CHECK_OTHERS用來比對所有的字元，檢查是否中特別獎、特獎、頭獎
        call CHECK_ALL

        cmp is_bingo, 1
        JNE CHECK_FIRST1   ;沒中獎就往下再檢查
        mov AX,1 ;1為特獎中獎
        RET

    CHECK_FIRST1:
        ;check 是否為頭獎
        mov SI, offset first_num1   ;SI 放頭獎號碼1的起始位址
        mov DI, offset user_num     ;DI 放使用者號碼的起始位址
        ;CHECK_OTHERS用來比對所有的字元，檢查是否中特別獎、特獎、頭獎
        call CHECK_ALL

        cmp is_bingo, 1
        JNE CHECK_FIRST2   ;沒中獎就往下再檢查
        mov AX,2 ;2為頭獎中獎
        RET

    CHECK_FIRST2:
        ;check 是否為頭獎
        mov SI, offset first_num2   ;SI 放頭獎號碼2的起始位址
        mov DI, offset user_num     ;DI 放使用者號碼的起始位址
        ;CHECK_OTHERS用來比對所有的字元，檢查是否中特別獎、特獎、頭獎
        call CHECK_ALL

        cmp is_bingo, 1
        JNE CHECK_FIRST3   ;沒中獎就往下再檢查
        mov AX,2 ;2為頭獎中獎
        RET

    CHECK_FIRST3:
        ;check 是否為頭獎
        mov SI, offset first_num3    ;SI 放頭獎號碼3的起始位址
        mov DI, offset user_num      ;DI 放使用者號碼的起始位址
        ;CHECK_OTHERS用來比對所有的字元，檢查是否中特別獎、特獎、頭獎
        call CHECK_ALL

        cmp is_bingo, 1
        JNE OTHERS1   ;沒中獎就往下再檢查
        mov AX,2 ;2為頭獎中獎
        RET

    OTHERS1:
        mov SI, offset first_num1      ;SI 放頭獎號碼1的起始位址
        mov DI, offset user_num        ;DI 放使用者號碼的起始位址
        ;CHECK_OTHERS用來比對倒數7個字元是否符合，檢查是否中二獎、三獎、四獎、五獎、六獎或沒中獎
        call CHECK_OTHERS ;跑完該副程式，AX會設定為3(二獎)、4(三獎)、5(四獎)、6(五獎)或 7(六獎)
        
        cmp is_bingo, 1
        JNE OTHERS2   ;沒中獎就往下再檢查
        RET
    OTHERS2:
        mov SI, offset first_num2      ;SI 放頭獎號碼2的起始位址
        mov DI, offset user_num        ;DI 放使用者號碼的起始位址
        ;CHECK_OTHERS用來比對倒數7個字元是否符合，檢查是否中二獎、三獎、四獎、五獎、六獎或沒中獎
        call CHECK_OTHERS ;跑完該副程式，AX會設定為3(二獎)、4(三獎)、5(四獎)、6(五獎)或 7(六獎)

        cmp is_bingo, 1
        JNE OTHERS3   ;沒中獎就往下再檢查
        RET
    OTHERS3:
        mov SI, offset first_num3       ;SI 放頭獎號碼3的起始位址
        mov DI, offset user_num         ;DI 放使用者號碼的起始位址
        ;CHECK_OTHERS用來比對倒數7個字元是否符合，檢查是否中二獎、三獎、四獎、五獎、六獎或沒中獎
        call CHECK_OTHERS ;跑完該副程式，AX會設定為3(二獎)、4(三獎)、5(四獎)、6(五獎)或 7(六獎)

        cmp is_bingo, 1
        JNE NO   ;沒中獎就往下再跳
        RET
    NO:
        mov AX,8 ;8為沒中獎
        RET
CHECK_NUM ENDP

INPUT_NUM proc near
    ;INPUT_NUM會顯示使用者輸入頁面，請使用者輸入要對獎的號碼
    
    ;清空螢幕
    MOV AX, 0600H
    MOV BH, 7
    MOV CX, 0
    MOV DX ,184FH
    INT 10H
    ;移動游標到(row=0,col=0)
    MOV DL, 0 ;col
    MOV DH, 0 ;row        
    MOV BH, 0
    MOV AH, 02h
    int 10h
    ;print main_str
    MOV AH,09
    MOV DH,0
    MOV DX,OFFSET MAIN_STR
    INT 21H 
    ;移動游標到(row=5,col=15)
    MOV DL, 15 ;col
    MOV DH, 5 ;row
    MOV BH, 0
    MOV AH, 02h
    int 10h
    ;print num_prompt_display
    MOV AH,09
    MOV DH,0
    MOV DX, OFFSET num_prompt_display
    INT 21H
    ;移動游標到(row=5,col=24)
    MOV DL, 24
    MOV DH, 5
    MOV BH, 0
    MOV AH, 02h
    int 10h
    ;READ user_num
    MOV AH,0AH
    MOV DX,offset user_num
    INT 21H
    RET
INPUT_NUM ENDP

Enter_Info proc near
    ;Enter_Info 進入程式開始頁面
    
    ;將DATA的起始位置移到ds
    mov ax,@DATA
    mov ds,ax 

    ;轉到text mode
    MOV AH, 0
    MOV AL, 3h
    INT 10h

    ;清空螢幕
    MOV AX, 0600H
    MOV BH, 7
    MOV CX, 0
    MOV DX ,184FH
    INT 10H

    ;print MAIN_STR
    MOV AH,09
    MOV DH,0
    MOV DX,OFFSET MAIN_STR
    INT 21H 

    ;移動游標到(row=1,col=5)
        MOV DL, 5 ;col
        MOV DH, 1 ;row
        MOV BH, 0
        MOV AH, 02h
        int 10h
    ;print prompt_display
        MOV AH,09
        MOV DH,0
        MOV DX, OFFSET prompt_display
        INT 21H
    ;移動游標到(row=2,col=5)
        MOV DL, 5 ;col
        MOV DH, 2 ;row
        MOV BH, 0
        MOV AH, 02h
        int 10h
    ;print super_num_display
        MOV AH,09
        MOV DH,0
        MOV DX, OFFSET super_num_display
        INT 21H
    ;移動游標到(row=3,col=5)
        MOV DL, 5
        MOV DH, 3
        MOV BH, 0
        MOV AH, 02h
        int 10h
    ;print special_num_display
        MOV AH,09
        MOV DH,0
        MOV DX,OFFSET special_num_display
        INT 21H
    ;移動游標到(row=4,col=5)
        MOV DL, 5
        MOV DH, 4
        MOV BH, 0
        MOV AH, 02h
        int 10h
    ;print first_num1_display
        MOV AH,09
        MOV DH,0
        MOV DX,OFFSET first_num1_display
        INT 21H
    ;移動游標到(row=5,col=5)
        MOV DL, 5
        MOV DH, 5
        MOV BH, 0
        MOV AH, 02h
        int 10h
    ;print first_num2_display
        MOV AH,09
        MOV DH,0
        MOV DX,OFFSET first_num2_display
        INT 21H
    ;移動游標到(row=5,col=5)
        MOV DL, 5
        MOV DH, 6
        MOV BH, 0
        MOV AH, 02h
        int 10h
    ;print first_num3_display
        MOV AH,09
        MOV DH,0
        MOV DX,OFFSET first_num3_display
        INT 21H

    ;READ super_num
        ;移動游標到(row=2,col=22)
        MOV DL, 22
        MOV DH, 2
        MOV BH, 0
        MOV AH, 02h
        int 10h
        ;READ super_num
        MOV AH,0AH
        MOV DX,offset super_num
        INT 21H

    ;READ special_num
        ;移動游標到(row=3,col=22)
        MOV DL, 22
        MOV DH, 3
        MOV BH, 0
        MOV AH, 02h
        int 10h
        ;READ special_num
        MOV AH,0AH
        MOV DX,offset special_num
        INT 21H
            
    ;READ first_num1
        ;移動游標到(row=4,col=22)
        MOV DL, 22
        MOV DH, 4
        MOV BH, 0
        MOV AH, 02h
        int 10h
        ;READ first_num1
        MOV AH,0AH
        MOV DX,offset first_num1
        INT 21H

    ;READ first_num2
        ;移動游標到(row=5,col=22)
        MOV DL, 22
        MOV DH, 5
        MOV BH, 0
        MOV AH, 02h
        int 10h
        ;READ first_num2
        MOV AH,0AH
        MOV DX,offset first_num2
        INT 21H

    ;READ first_num3
        ;移動游標到(row=6,col=22)
        MOV DL, 22
        MOV DH, 6
        MOV BH, 0
        MOV AH, 02h
        int 10h
        ;READ first_num3
        MOV AH,0AH
        MOV DX,offset first_num3
        INT 21H 
    
    ;移動游標到(row=7,col=22)
        MOV DL, 5
        MOV DH, 7
        MOV BH, 0
        MOV AH, 02h
        int 10h
    ;print continueORquit
        MOV AH,09
        MOV DH,0
        MOV DX,OFFSET continueORquit
        INT 21H
    RET
Enter_Info ENDP

PLAY_MUSIC PROC    near
    ;該副程式擷取至作業08的練習檔
        PUSH    AX
        PUSH    BX
        PUSH    CX
        PUSH    DX

        MOV     AL, 0B6H              ; SET PARAMETERS OF 8254
        OUT     43H, AL                ; SET 8254 CONTROL MODE

        MOV     AL, DL                ; SET 8254 TIMER 2 DATA
        OUT     42H, AL                ; FREQUENCY IN DX
        MOV     AL, DH                ;
        OUT     42H, AL

        MOV     AX, SI ;SI為音的長度
DELAY:  MOV     CX, 0000FFH
DELY2:  NOP
        LOOP    DELY2
        DEC     AX
        JNZ     DELAY

        POP     DX
        POP     CX
        POP     BX
        POP     AX
        RET
PLAY_MUSIC ENDP

END main