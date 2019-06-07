void setuptexttospeach(){
  pinMode(rxPin, INPUT);
  pinMode(txPin, OUTPUT);
   // set the data rate for the SoftwareSerial port
  emicSerial.begin(9600);

 
  
  /*
    When the Emic 2 powers on, it takes about 3 seconds for it to successfully
    intialize. It then sends a ":" character to indicate it's ready to accept
    commands. If the Emic 2 is already initialized, a CR will also cause it
    to send a ":"
  */
  emicSerial.print('\n');             // Send a CR in case the system is already up
  while (emicSerial.read() != ':');   // When the Emic 2 has initialized and is ready, it will send a single ':' character, so wait here until we receive it
  delay(10);                          // Short delay
  emicSerial.flush(); 
  emicSerial.print('N');
  emicSerial.print("3");  // Send the desired string to convert to speech
  emicSerial.print('\n');
  emicSerial.print('W');
  emicSerial.print("110");  // Send the desired string to convert to speech
  emicSerial.print('\n');
   emicSerial.print('V');
  emicSerial.print("18");  // Send the desired string to convert to speech
  emicSerial.print('\n');
  }

  
void checkupRfid (){
  for (uint8_t reader = 0; reader < NR_OF_READERS; reader++) {
    mfrc522[reader].PCD_Init(ssPins[reader], RST_PIN); // Init each MFRC522 card
    Serial.print(F("Reader "));
    Serial.print(reader);
    Serial.print(F(": "));
    mfrc522[reader].PCD_DumpVersionToSerial();
  }
  }


void setupbuttons(){
  
  pinMode(leftbutton,INPUT);//initialize the key pin as input 
  digitalWrite(leftbutton, HIGH); //set pullup
  pinMode(middlebutton,INPUT);//initialize the key pin as input 
  digitalWrite(middlebutton, HIGH); //set pullup
  pinMode(rightbutton,INPUT);//initialize the key pin as input 
  digitalWrite(rightbutton, HIGH); //set pullup
  
  }
