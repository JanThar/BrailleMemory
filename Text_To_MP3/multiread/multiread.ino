#include <SPI.h>
#include <Adafruit_VS1053.h>
#include <SD.h>
#include <MFRC522.h>

 //---------------------------------------------------------------------------------------------------------------------------------------------
 //rfid defines
 
  #define SS_1_PIN          5
  #define RST_PIN           4

//MP3 player defines
  // These are the pins used for the breakout example
#define BREAKOUT_RESET  9      // VS1053 reset pin (output)
#define BREAKOUT_CS     10     // VS1053 chip select pin (output)
#define BREAKOUT_DCS    8      // VS1053 Data/command select pin (output)
// These are the pins used for the music maker shield
#define SHIELD_RESET  -1      // VS1053 reset pin (unused!)
#define SHIELD_CS     7      // VS1053 chip select pin (output)
#define SHIELD_DCS    6      // VS1053 Data/command select pin (output)

// These are common pins between breakout and shield
#define CARDCS 4     // Card chip select pin
// DREQ should be an Int pin, see http://arduino.cc/en/Reference/attachInterrupt
#define DREQ 3       // VS1053 Data request, ideally an Interrupt pin

Adafruit_VS1053_FilePlayer musicPlayer = 
  // create breakout-example object!
 //Adafruit_VS1053_FilePlayer(BREAKOUT_RESET, BREAKOUT_CS, BREAKOUT_DCS, DREQ, CARDCS);
  // create shield-example object!
  Adafruit_VS1053_FilePlayer(SHIELD_RESET, SHIELD_CS, SHIELD_DCS, DREQ, CARDCS);
  



  constexpr uint8_t NR_OF_READERS = 1;
  byte ssPins[] = {SS_1_PIN};
  
  MFRC522 mfrc522[NR_OF_READERS]; 
  MFRC522::StatusCode status; //variable to get card status
 
  byte buffer[18];
  byte buffersc[18];//data transfer buffer (16+2 bytes data+CRC)
  byte size = sizeof(buffer);

  uint8_t pageAddr = 0x06;  //In this example we will write/read 16 bytes (page 6,7,8 and 9).
                            //Ultraligth mem = 16 pages. 4 bytes per page. 
                            //Pages 0 to 4 are for special functions.        
                            
void setup() {
  Serial.begin(9600); // Initialize serial communications with the PC
  SPI.begin(); // Init SPI bus
  
  if (! musicPlayer.begin()) { // initialise the music player
     Serial.println(F("Couldn't find VS1053, do you have the right pins defined?"));
     while (1);
  }
  Serial.println(F("VS1053 found"));
  
   if (!SD.begin(CARDCS)) {
    Serial.println(F("SD failed, or not present"));
    while (1);  // don't do anything more
  }


  
  // Set volume for left, right channels. lower numbers == louder volume!
  musicPlayer.setVolume(20,20);

 checkupRfid();

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
