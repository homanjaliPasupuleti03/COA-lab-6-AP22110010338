ORG 100h          
; Origin, to specify that the program starts at 100h (COM file format) 
; Print "Enter the input: " 
MOV AH, 09h       ; DOS func on 09h: print string 
MOV DX, OFFSET msg_enter_input ; Load address of the string 
INT 21h
           ; Call DOS interrupt to print the string 
; Read mul ple characters from user 
MOV AH, 0Ah       ; DOS func on 0Ah: buffered input 
MOV DX, OFFSET input_buffer  ; Load address of the input buffer 
INT 21h
           ; Call DOS interrupt to read the string 
; Add a $ at the end of the entered string for prin ng 
MOV AL, '$'            
; Store $ in AL 
LEA DI, input_buffer+2 ; DI points to the actual input string 
MOV CL, [input_buffer+1] ; Get the count of characters entered 
ADD DI, CX             
MOV [DI], AL           
; Move DI to the end of the entered string 
; Insert $ at the end of the string 
; Print "The entered input is: " 
MOV AH, 09h       ; DOS func on 09h: print string 
MOV DX, OFFSET msg_entered_input ; Load address of the second string 
INT 21h
           ; Call DOS interrupt to print the string 
; Print the entered string 
LEA DX, input_buffer+2  ; Load address of the actual input (skip buffer size and count) 
MOV AH, 09h             
INT 21h
 ; DOS func on 09h: print string 
                 ; Call DOS interrupt to print the input string 
; Terminate the program 
MOV AH, 4Ch       ; DOS func on 4Ch: terminate program 
INT 21h
           ; Call DOS interrupt to exit 
; Data sec on 
msg_enter_input DB 'Enter the input: $'          
; Prompt message 
msg_entered_input DB 0Dh, 0Ah, 'The entered input is: $' ; Newline and display message 
input_buffer DB 10, 0   ; Buffer to store input: 10 max chars, ini al count 0 
; The actual characters will be stored star ng here 
; Followed by a terminator (CR) 
END         
; End of program