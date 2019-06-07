/* mifare ultralight example (25-02-2018)
 *
 *   RFID-RC522 (SPI connexion)
 *   
 *   CARD RC522      Arduino (UNO)
 *      serial ------- 2,3
 *     
 *     SDA1  -----------  10 left
 *     SDA2  -----------  8 right
 *     SDA3  -----------  9 middle
 *     button1----------  7 left
 *     button2----------  6 middle
 *     button3----------  5 right
 *     SCK  -----------  13
 *     MOSI -----------  11
 *     MISO -----------  12
 *     IRQ  ----------- 
 *     GND  -----------  GND
 *     RST  -----------  4 (onfigurable, see RST_PIN constant)
 *     3.3V ----------- 3.3V
 *     
 */

  #include <SPI.h>
  #include <MFRC522.h>

  #include <SoftwareSerial.h>

  
 //---------------------------------------------------------------------------------------------------------------------------------------------
  //text to speach defines

  #define rxPin 2    // Serial input (connects to Emic 2 SOUT)
  #define txPin 3    // Serial output (connects to Emic 2 SIN)

  SoftwareSerial emicSerial =  SoftwareSerial(rxPin, txPin);

 //---------------------------------------------------------------------------------------------------------------------------------------------
 //rfid defines
 
  #define SS_1_PIN          10
  #define SS_2_PIN          8
  #define SS_3_PIN          9
  #define RST_PIN           4

  constexpr uint8_t NR_OF_READERS = 1;
  byte ssPins[] = {SS_1_PIN, SS_2_PIN, SS_3_PIN};
  
  MFRC522 mfrc522[NR_OF_READERS]; 
  MFRC522::StatusCode status; //variable to get card status
 
  byte buffer[18];
  byte buffersc[18];//data transfer buffer (16+2 bytes data+CRC)
  byte size = sizeof(buffer);

  uint8_t pageAddr = 0x06;  //In this example we will write/read 16 bytes (page 6,7,8 and 9).
                            //Ultraligth mem = 16 pages. 4 bytes per page. 
                            //Pages 0 to 4 are for special functions.        

 //---------------------------------------------------------------------------------------------------------------------------------------------
 //button defines

  const int leftbutton = 7; //the number of the key pin
  const int middlebutton = 6; //the number of the key pin
  const int rightbutton = 5; //the number of the key pin

     
 
void setup() {
 setuptexttospeach();
  


  Serial.begin(9600); // Initialize serial communications with the PC
  SPI.begin(); // Init SPI bus

 checkupRfid();
 setupbuttons();
  
  Serial.println(F("Sketch has been started!"));
 
  
}

String mystring;
bool set1 = false;
bool set2= false;
bool check = true;

void loop() {


  
  for (uint8_t reader = 0; reader < NR_OF_READERS; reader++) {
 
 
    
 if ( ! mfrc522[reader].PICC_IsNewCardPresent()){}
 
  else{
    

  // Select one of the cards
  if ( ! mfrc522[reader].PICC_ReadCardSerial()){}
  
  else{

 
      

       // Read data ***************************************************
            Serial.println(F("Reading data ... "));
       //data in 4 block is readed at once.
       if (! set1){
            status = (MFRC522::StatusCode) mfrc522[reader].MIFARE_Read(pageAddr, buffer, &size);
            if (status != MFRC522::STATUS_OK) {
                Serial.print(F("MIFARE_Read() failed: "));
                Serial.println(mfrc522[reader].GetStatusCodeName(status));
                size = sizeof(buffer);
                }
                else{
                  Serial.print(F("Readed data: "));
        //Dump a byte array to Serial
        for (byte i = 0; i < 3; i++) {
    Serial.write(buffer[i]);
  }
  Serial.println();
                  
                  
                  set1=true;
            
                  
                  speak(lookup(buffer));
                  }
                  
       }
       else{
            status = (MFRC522::StatusCode) mfrc522[reader].MIFARE_Read(pageAddr, buffersc, &size);
            if (status != MFRC522::STATUS_OK) {
                Serial.print(F("MIFARE_Read() failed: "));
                Serial.println(mfrc522[reader].GetStatusCodeName(status));
                size = sizeof(buffersc);
                }
                else{
                  Serial.print(F("Readed data: "));
  //Dump a byte array to Serial
  for (byte i = 0; i < 3; i++) {
    Serial.write(buffersc[i]);
  }
  Serial.println();
                  set2= true;
                  speak(lookup(buffersc));
    
  }
   mfrc522[reader].PICC_HaltA();
  
                  
                  
                 
                  }
        
        }
        if(set1 && set2){
          for (byte i = 1; i < 3; i++) {
          
                  
                  if(buffer[i]==buffersc[i]&& check == true){check = true;}
                  else{check = false;}
                  
          }
         while(digitalRead(rightbutton)== HIGH){}    
          if(check)
  {
     speak("correct"); 
    }
    else
    {
      speak("false "); 
     
      }
          
            
 
   
      set1=false;
      set2=false;
      check = true;
      speak("next pair");
           
            
            
       }
       }
  }
 
}
