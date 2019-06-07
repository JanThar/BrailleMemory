String lookup (byte arr[]){
  String type;
  type = lookupType(arr);

  if(type == "clear letter" || type == "braille letter"){
     String character;
     character = lookupChar(arr);

     return "The Card shows a " + type + " with the letter  " + character;
    
    }
    
  if(type == "Operator"){
     String player;
     String op;
     player = lookupPlayer(arr);
     op = lookupOperator(arr);
    
    return "this is a " + type +" card and belongs to player  " + player + " and  shows the " + op +" operator" ;
    
    }
  


  return type;
  }
