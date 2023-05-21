//KC03F15  JOB  TIME=(,2)                                               
//*********************************************                         
//*PLACE THE NAME OF THE PDS THAT CONTAINS YOUR SYMBOLIC SCREEN         
//*AFTER THE KEYWORD "DSCTLIB=". PLACE THE NAME OF THE PDS THAT         
//*CONTAINS YOUR COBOL SOURCE CODE "SRCLIB=". WRITE THE CODE FOR YOUR   
//*COBOL PROGRAM AFTER THE "//COBOL.SYSIN DD *" STATEMENT BELOW.        
//*****************************************************                 
//         EXEC  CICSCBL,DSCTLIB='HLUSAK.CICSYMBO',                     
//             SRCLIB=HLUSAK.COBOL@2                                    
//COBOL.SYSUT1 DD UNIT=&WORK,SPACE=(CYL,(1,1))                          
//COBOL.SYSIN  DD *                                                     
       IDENTIFICATION DIVISION.                                         
       PROGRAM-ID. CICSMAPP.                                            
       ENVIRONMENT DIVISION.                                            
       DATA DIVISION.                                                   
       WORKING-STORAGE SECTION.                                         
      *                                                                 
       01 SWITCHES.                                                     
          05 VALID-DATA-SWITCH  PIC X VALUE 'Y'.                        
             88 VALID-DATA            VALUE 'Y'.                        
      *                                                                 
       01 FLAGS.                                                        
          05 SEND-FLAGS         PIC X.                                  
             88 SEND-ERASE            VALUE '1'.                        
             88 SEND-DATAONLY         VALUE '2'.                        
             88 SEND-DATAONLY-ALARM   VALUE '3'.                        
      *                                                                 
       01 COMMUNICATION-AREA    PIC X.                                  
       01 RESPONSE-CODE         PIC S9(8) COMP.                         
       01 END-OF-SESSION-MESSAGE PIC X(23) VALUE 'THANKS FOR VISITING'. 
       01 AN-ERROR-OCCURED       PIC X(23) VALUE 'ERROR OCURRED  '.     
       01 WARNING-NAME-INVALID  PIC X(23) VALUE 'NAME IS INVALID'.      
       01 WARNING-PAY-INVALID  PIC X(23) VALUE 'HOURLY PAY INVALID '.   
       01 WARNING-HOURS-INVALID  PIC X(23) VALUE 'HOURS WORKED INVALID'.
       01 POST-CALC-MESSAGE      PIC X(23) VALUE 'PAYCHECK PROESSED'.   
       01 MESSAGE-SAVE           PIC X(23).                             
      *                                                                 
       01 EMP-NAME      PIC X(30) VALUE "MR                       ".    
       01 EMP-HOURS     PIC X(02).                                      
       01 EMP-HRLY-PAY  PIC X(02).                                      
       01 END-MSG PIC X(20) VALUE "THANKS..GOODBYE".                    
       01 WS-MSG PIC X(20) VALUE 'HELLO'.                               
                                                                        
       01 RD-HOURS             PIC 9(02).                               
       01 RD-EMP-HRLY-PAY      PIC 9(02).                               
                                                                        
       01 XRD-HOURS            PIC X(02).                               
       01 XRD-EMP-HRLY-PAY     PIC X(02).                               
                                                                        
       01 GROSS-SAVE           PIC 9(09).                               
       01 FED-TAX-SAVE         PIC 9(07).                               
       01 STATE-TAX-SAVE       PIC 9(07).                               
       01 SOC-SEC-SAVE         PIC 9(07).                               
       01 NET-PAY-SAVE         PIC 9(08).                               
                                                                        
      *                                                                 
       COPY MIKEMAP.                                                    
      *                                                                 
       COPY DFHAID.                                                     
      *                                                                 
      *                                                                 
       LINKAGE SECTION.                                                 
       01 DFHCOMMAREA       PIC X.                                      
      *                                                                 
                                                                        
       PROCEDURE DIVISION.                                              
      *                                                                 
       0000-MAIN.                                                       
             MOVE DFHCOMMAREA TO COMMUNICATION-AREA.                    
             EVALUATE TRUE                                              
                WHEN EIBCALEN = ZERO                                    
                   MOVE LOW-VALUE TO DIS1I                              
                   MOVE '1' TO SEND-FLAGS                               
                   PERFORM 100-SEND-MAP                                 
                WHEN EIBAID = DFHPA3 OR DFHPF3                          
                   PERFORM 2000-TERMINATION-MESSAGE                     
                   EXEC CICS                                            
                      RETURN                                            
                   END-EXEC                                             
                WHEN EIBAID = DFHPF12                                   
                    MOVE LOW-VALUE TO DIS1I                             
                    MOVE "PLEASE RE-ENTER INPUT, THANKS" TO  MESSAGEO   
                    MOVE '1' TO SEND-FLAGS                              
                    PERFORM 100-SEND-MAP                                
                WHEN EIBAID = DFHENTER                                  
                   PERFORM 200-RECEIVE-MAP                              
                WHEN OTHER                                              
                    MOVE LOW-VALUE TO DIS1I                             
                    MOVE 'INVALID KEY PRESSED.' TO MESSAGEO             
                    MOVE '1' TO SEND-FLAGS                              
                    PERFORM 100-SEND-MAP                                
               END-EVALUATE.                                            
               EXEC CICS                                                
                  RETURN TRANSID('F151')                                
                     COMMAREA(COMMUNICATION-AREA)                       
               END-EXEC.                                                
                                                                        
         100-SEND-MAP.                                                  
                 EXEC CICS                                              
                 SEND                                                   
                 MAP('DIS1') MAPSET('MIKEMAP')                          
                 ERASE                                                  
                 END-EXEC.                                              
                                                                        
         200-RECEIVE-MAP.                                               
                 EXEC CICS                                              
                 RECEIVE                                                
                 MAP('DIS1') MAPSET('MIKEMAP') INTO(DIS1I)              
                 END-EXEC.                                              
              EVALUATE TRUE                                             
                WHEN NAMESINI = LOW-VALUE                               
                   MOVE LOW-VALUE TO DIS1O                              
                   MOVE 'NO NAME ENTERED - ENTER NAME' TO MESSAGEO      
                   MOVE -1 TO NAMESINL                                  
                   MOVE '0' TO SEND-FLAGS                               
                WHEN HRPAYINI = LOW-VALUE                               
                   MOVE LOW-VALUE TO DIS1O                              
                   MOVE -1 TO HRPAYINL                                  
                   MOVE -1 TO HRPAYINL                                  
                   MOVE 'PLEASE ENTER PAY RATE' TO MESSAGEO             
                   MOVE '0' TO SEND-FLAGS                               
                WHEN HRSWRKDI = LOW-VALUE                               
                    MOVE LOW-VALUE TO DIS1O                             
                    MOVE -1 TO HRSWRKDL                                 
                    MOVE 'PLEASE ENTER HOURS WORKED' TO MESSAGEO        
                    MOVE '0' TO SEND-FLAGS                              
                WHEN OTHER                                              
                   MOVE NAMESINI TO WS-MSG                              
                   MOVE WS-MSG TO NAMESINO                              
                                                                        
                   MOVE HRSWRKDI TO RD-HOURS                            
                   MOVE HRPAYINI TO RD-EMP-HRLY-PAY                     
                                                                        
                   MOVE HRPAYINI TO XRD-EMP-HRLY-PAY                    
                   MOVE HRSWRKDI TO XRD-HOURS                           
                   MOVE XRD-EMP-HRLY-PAY TO HRPAYINO                    
                   MOVE XRD-HOURS        TO HRSWRKDO                    
                                                                        
                   COMPUTE GROSS-SAVE = RD-HOURS * RD-EMP-HRLY-PAY      
                   MOVE GROSS-SAVE     TO GROSSPYO                      
                                                                        
                   COMPUTE FED-TAX-SAVE = GROSS-SAVE * .20              
                   MOVE FED-TAX-SAVE   TO FEDTAXSO                      
                                                                        
                   COMPUTE STATE-TAX-SAVE = GROSS-SAVE * .10            
                   MOVE STATE-TAX-SAVE TO STATETXO                      
                                                                        
                   COMPUTE SOC-SEC-SAVE = GROSS-SAVE * .062             
                   MOVE SOC-SEC-SAVE   TO SOCSECUO                      
                                                                        
                   COMPUTE NET-PAY-SAVE = GROSS-SAVE -                  
                   (FED-TAX-SAVE + STATE-TAX-SAVE + SOC-SEC-SAVE)       
                   MOVE NET-PAY-SAVE TO NETPAYSO                        
                                                                        
                   DISPLAY "           *CICS CALC*       "              
                   DISPLAY "GROSS-SAVE         (" GROSS-SAVE      ")"   
                   DISPLAY "FED-TAX-SAVE       (" FED-TAX-SAVE    ")"   
                   DISPLAY "STATE-TAX-SAVE     (" STATE-TAX-SAVE  ")"   
                   DISPLAY "GROSS-SAVE         (" GROSS-SAVE      ")"   
                   DISPLAY "GROSS-SAVE         (" GROSS-SAVE      ")"   
                   DISPLAY "GROSS-SAVE         (" GROSS-SAVE      ")"   
                   DISPLAY "                       "                    
               END-EVALUATE                                             
               PERFORM 100-SEND-MAP.                                    
      *                                                                 
         300-RETURN.                                                    
                EXEC CICS                                               
                RETURN                                                  
                END-EXEC.                                               
         2000-TERMINATION-MESSAGE.                                      
                 EXEC CICS                                              
                     SEND TEXT FROM(END-OF-SESSION-MESSAGE)             
                          ERASE                                         
                          FREEKB                                        
                 END-EXEC.                                              
/*                                                                      
//***********************************************                       
//*PLACE THE NAME OF YOUR PROGRAM IN THE PARENTHESIS AFTER THE          
//*WORD "LOADLIB".                                                      
//****************************************************                  
//LKED.SYSLMOD DD DSNAME=TSOECCC.CICSTS12.STUDENT.LOADLIB(MIKEPGM)                                                                                                                                                                                                                              
                                                                        
