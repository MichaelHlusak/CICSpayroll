       01  DIS1I.                                                               
           02  FILLER PIC X(12).                                                
           02  NAMESINL    COMP  PIC  S9(4).                                    
           02  NAMESINF    PICTURE X.                                           
           02  FILLER REDEFINES NAMESINF.                                       
             03 NAMESINA    PICTURE X.                                          
           02  NAMESINI  PIC X(30).                                             
           02  FILLER PIC X.                                                    
           02  HRPAYINL    COMP  PIC  S9(4).                                    
           02  HRPAYINF    PICTURE X.                                           
           02  FILLER REDEFINES HRPAYINF.                                       
             03 HRPAYINA    PICTURE X.                                          
           02  HRPAYINI  PIC X(2).                                              
           02  FILLER PIC X.                                                    
           02  HRSWRKDL    COMP  PIC  S9(4).                                    
           02  HRSWRKDF    PICTURE X.                                           
           02  FILLER REDEFINES HRSWRKDF.                                       
             03 HRSWRKDA    PICTURE X.                                          
           02  HRSWRKDI  PIC X(2).                                              
           02  FILLER PIC X.                                                    
           02  GROSSPYL    COMP  PIC  S9(4).                                    
           02  GROSSPYF    PICTURE X.                                           
           02  FILLER REDEFINES GROSSPYF.                                       
             03 GROSSPYA    PICTURE X.                                          
           02  GROSSPYI  PIC X(9).                                              
           02  FEDTAXSL    COMP  PIC  S9(4).                                    
           02  FEDTAXSF    PICTURE X.                                           
           02  FILLER REDEFINES FEDTAXSF.                                       
             03 FEDTAXSA    PICTURE X.                                          
           02  FEDTAXSI  PIC X(7).                                              
           02  STATETXL    COMP  PIC  S9(4).                                    
           02  STATETXF    PICTURE X.                                           
           02  FILLER REDEFINES STATETXF.                                       
             03 STATETXA    PICTURE X.                                          
           02  STATETXI  PIC X(7).                                              
           02  SOCSECUL    COMP  PIC  S9(4).                                    
           02  SOCSECUF    PICTURE X.                                           
           02  FILLER REDEFINES SOCSECUF.                                       
             03 SOCSECUA    PICTURE X.                                          
           02  SOCSECUI  PIC X(7).                                              
           02  NETPAYSL    COMP  PIC  S9(4).                                    
           02  NETPAYSF    PICTURE X.                                           
           02  FILLER REDEFINES NETPAYSF.                                       
             03 NETPAYSA    PICTURE X.                                          
           02  NETPAYSI  PIC X(8).                                              
           02  FILLER PIC X.                                                    
           02  MESSAGEL    COMP  PIC  S9(4).                                    
           02  MESSAGEF    PICTURE X.                                           
           02  FILLER REDEFINES MESSAGEF.       
             03 MESSAGEA    PICTURE X.                                          
           02  MESSAGEI  PIC X(79).                                             
       01  DIS1O REDEFINES DIS1I.                                               
           02  FILLER PIC X(12).                                                
           02  FILLER PICTURE X(3).                                             
           02  NAMESINO  PIC X(30).                                             
           02  FILLER PIC X.                                                    
           02  FILLER PICTURE X(3).                                             
           02  HRPAYINO  PIC X(2).                                              
           02  FILLER PIC X.                                                    
           02  FILLER PICTURE X(3).                                             
           02  HRSWRKDO  PIC X(2).                                              
           02  FILLER PIC X.                                                    
           02  FILLER PICTURE X(3).                                             
           02  GROSSPYO  PIC X(9).                                              
           02  FILLER PICTURE X(3).                                             
           02  FEDTAXSO  PIC X(7).                                              
           02  FILLER PICTURE X(3).                                             
           02  STATETXO  PIC X(7).                                              
           02  FILLER PICTURE X(3).                                             
           02  SOCSECUO  PIC X(7).                                              
           02  FILLER PICTURE X(3).                                             
           02  NETPAYSO  PIC X(8).                                              
           02  FILLER PIC X.                                                    
           02  FILLER PICTURE X(3).                                             
           02  MESSAGEO  PIC X(79).                                                   
