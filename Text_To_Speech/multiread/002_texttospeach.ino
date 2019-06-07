void speak (String msg){
    
   emicSerial.print('S');
  emicSerial.print(msg);  // Send the desired string to convert to speech
  emicSerial.print('\n');
        // Turn on LED while Emic is outputting audio
  while (emicSerial.read() != ':');   // Wait here until the Emic 2 responds with a ":" indicating it's ready to accept the next command
 
    
  delay(3000);    // 1/2 second delay
    
  
  
  }
