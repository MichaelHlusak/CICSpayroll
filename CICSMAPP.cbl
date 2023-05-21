//KC03F15  JOB  TIME=(,2)                                                
//******************************************                             
//*AFTER THE KEYWORD "MAPNAME" WRITE YOUR MAPSET NAME. AFTER THE         
//*KEYWORD "MAPLIB" WRITE THE NAME OF YOUR PHYSICAL MAPSET PDS.          
//*AFTER THE KEYWORD "DSCTLIB" WRITE THE NAME OF YOUR SMBOLIC            
//*MAPSET PDS. ENCLOSE THE NAME IN SINGLE QUOTES WITH NO LOGIN ID.       
//*THE JCL PROCESSOR WILL ATTACH THE JOB NAME TO YOUR PDS NAMES.         
//*PLEASE DO NOT USE THE NAMES SHOWN IN "MAPLIB" AND "DSCTLIB".          
//****************************************************                   
//         EXEC PROC=DFHMAPS,MAPNAME=MIKEMAP,                          * 
//             MAPLIB='HLUSAK.CICSPHYS',                               * 
//             DSCTLIB='HLUSAK.CICSYMBO'                                 
//COPY.SYSUT1 DD *                                                       
        PRINT NOGEN                                                      
MIKEMAP DFHMSD TYPE=MAP,MODE=INOUT,TERM=ALL,CTRL=FREEKB,               X 
               STORAGE=AUTO,LANG=COBOL,TIOAPFX=YES                       
DIS1    DFHMDI SIZE=(24,80),LINE=1,COLUMN=1                              
        DFHMDF POS=(1,1),INITIAL='SPRING 2023',LENGTH=11,              X 
               ATTRB=PROT                                                
        DFHMDF POS=(1,26),LENGTH=28,ATTRB=(NORM,PROT),                 X 
               INITIAL='EMPLOYEE PAYROLL INFORMATION'                    
        DFHMDF POS=(4,1),LENGTH=33,ATTRB=(NORM,PROT),                  X 
               INITIAL='PLEASE ENTER THE EMPLOYEES NAME '                
NAMESIN DFHMDF POS=(5,1),LENGTH=30,ATTRB=(NORM,UNPROT,IC),             X 
               INITIAL='___________________________________'             
        DFHMDF POS=(6,1),LENGTH=33,ATTRB=(NORM,PROT),                  X 
               INITIAL='PLEASE ENTER THE HOURLY PAY RATE '               
HRPAYIN DFHMDF POS=(7,2),LENGTH=2,ATTRB=(NORM,UNPROT),                 X 
               INITIAL='__'                                              
        DFHMDF POS=(8,1),LENGTH=30,ATTRB=(NORM,PROT),                  X 
               INITIAL='PLEASE ENTER THE HOURS WORKED '                  
HRSWRKD DFHMDF POS=(9,2),LENGTH=2,ATTRB=(NORM,UNPROT),                 X 
               INITIAL='__'                                              
        DFHMDF POS=(10,1),LENGTH=10,ATTRB=(NORM,PROT),                 X 
               INITIAL='GROSS PAY '                                      
GROSSPY DFHMDF POS=(10,20),LENGTH=9,ATTRB=(NORM,PROT),                 X 
               INITIAL='         '                                       
        DFHMDF POS=(12,1),LENGTH=14,ATTRB=(NORM,PROT),                 X 
               INITIAL='FEDERAL TAXES '                                  
FEDTAXS DFHMDF POS=(12,20),LENGTH=7,ATTRB=(NORM,PROT),                 X 
               INITIAL='       '                                         
        DFHMDF POS=(14,1),LENGTH=12,ATTRB=(NORM,PROT),                 X 
               INITIAL='STATE TAXES '                                    
STATETX DFHMDF POS=(14,20),LENGTH=7,ATTRB=(NORM,PROT),                 X 
               INITIAL='       '                                         
        DFHMDF POS=(16,1),LENGTH=15,ATTRB=(NORM,PROT),                 X 
               INITIAL='SOCIAL SECURITY'                                 
SOCSECU DFHMDF POS=(16,20),LENGTH=7,ATTRB=(NORM,PROT),                 X 
               INITIAL='       '                                         
         DFHMDF POS=(18,1),LENGTH=8,ATTRB=(NORM,PROT),                  X 
                INITIAL='NET PAY '                                        
 NETPAYS DFHMDF POS=(18,20),LENGTH=8,ATTRB=(NORM,PROT),                 X 
                INITIAL='        '                                        
 MESSAGE DFHMDF POS=(23,1),LENGTH=79,ATTRB=(NORM,PROT),                 X 
                INITIAL='ENTER FIELDS THEN PRESS ENTER '                  
         DFHMDF POS=(24,1),LENGTH=20,ATTRB=(NORM,PROT),                 * 
                INITIAL='F3=EXIT   F12=CANCEL'                            
         DFHMDF POS=(24,79),LENGTH=1,ATTRB=(DRK,PROT,FSET),INITIAL=' '    
         DFHMSD TYPE=FINAL                                                
                END                                                       
 /*                                                                       
 //COPY.SYSPUNCH DD SYSOUT=B                                              
 //LINKMAP.SYSLMOD DD DSN='TSOECCC.CICSTS12.STUDENT.LOADLIB',DISP=SHR     
 //LINKMAP.SYSLIN  DD                                                     
 //  DD  *                                                                
    NAME MIKEMAP(R)                                                       
 /*                                                                       
 //***********************************************                        
 //*AFTER "NAME" ABOVE WRITE YOUR MAPSET NAME.                            
 //**********************************************                         
