String lookupType(byte arr[])
{
  String match;
  match = rewriteType(arr);

  
  if(match == "k")
  {
    return "clear letter";
    }
    

  if(match == "b")
  {
    return "braille letter";
    }


    
  if(match == "o")
  {
    return "Operator";
    }


 
  return "Unknown Type";
  }




String lookupPlayer(byte arr[]){
      String match;
      match = rewriteplayer(arr);
    
    if(match == "b"){
      return "blue";
      }
      
    if(match == "g"){
      return "yellow";
      }
      
    if(match == "o"){
      return "orange";
      }
      
    if(match == "e"){
      return "green";
      }
    
    return "unknown player";
}

String lookupOperator(byte arr[]){
      String match;
      match = rewriteoperator(arr);

      if(match == "u"){
        return "not similar";
        }
      
      if(match == "g"){
        return "similar";
        }
  
      }

String lookupChar(byte arr[])
  {
      String match;
      match = rewriteId(arr);


      if (match == "aa"){
       
        return "ai";
        }
        
      if (match == "bb"){
        return "b";
        }

      if (match == "cc"){
        return "c";
        }
        
      if (match == "dd"){
        return "d";
        }
        
      if (match == "ee"){
        return "e";
        }
        
      if (match == "ff"){
        return "f";
        }
        
      if (match == "gg"){
        return "g";
        }

      if (match == "hh"){
        return "h";
        }
        
      if (match == "ii"){
        return "i";
        }
        
      if (match == "jj"){
        return "j";
        }

      if (match == "kk"){
        return "k";
        }
        
      if (match == "ll"){
        return "l";
        }

      if (match == "mm"){
        return "m";
        }
        
      if (match == "nn"){
        return "n";
        }
        
      if (match == "oo"){
        return "o";
        }
        
      if (match == "pp"){
        return "p";
        }
        
      if (match == "qq"){
        return "q";
        }

      if (match == "rr"){
        return "r";
        }
        
      if (match == "ss"){
        return "s";
        }
        
      if (match == "tt"){
        return "t";
        }
        
     if (match == "uu"){
        return "u";
        }
        
      if (match == "vv"){
        return "v";
        }

      if (match == "ww"){
        return "w";
        }
        
      if (match == "xx"){
        return "x";
        }
        
      if (match == "yy"){
        return "y";
        }
        
      if (match == "zz"){
        return "z";
        }
        
      if (match == "pa"){
        return "ä";
        }

      if (match == "po"){
        return "ö";
        }
        
      if (match == "pu"){
        return "ü";
        }
        
      if (match == "sz"){
        return "eszet";
        }

      if (match == "st"){
        return "st";
        }
        
      if (match == "au"){
        return "au";
        }

      if (match == "eu"){
        return "eu";
        }
        
      if (match == "ei"){
        return "ei";
        }
        
      if (match == "pe"){
        return "äu";
        }
        
      if (match == "ie"){
        return "ie";
        }
        
      if (match == "ch"){
        return "ch";
        }

      if (match == "sc"){
        return "sc";
        }
        
      if (match == "ko"){
        return ",";
        }
        
      if (match == "se"){
        return ";";
        }

      if (match == "dp"){
        return ":";
        }
        
      if (match == "ti"){
        return "~";
        }

      if (match == "cc"){
        return "\"";
        }
        
      if (match == "ga"){
        return ">";
        }
        
      if (match == "pk"){
        return ".";
        }
        
      if (match == "pl"){
        return "+";
        }
        
      if (match == "ma"){
        return "*";
        }
        
      if (match == "mi"){
        return "-";
        }

      if (match == "ri"){
        return "»";
        }
        
      if (match == "kl"){
        return "()";
        }
        
      if (match == "le"){
        return "«";
        }

      if (match == "gk"){
        return "#";
        }
        
      if (match == "hk"){
        return "'";
        }

      if (match == "fr"){
        return "?";
        }
        
      if (match == "di"){
        return "\\";
        }
        
      if (match == "sa"){
        return "<";
        }
        
      if (match == "do"){
        return "$";
        }
        
     if (match == "us"){
        return "_";
        }

      if (match == "ek"){
        return "[";
        }
        
      if (match == "pr"){
        return "%";
      }
      
      if (match == "ha"){
        return "circumflex";
        }
        
      if (match == "ht"){
        return "`";
        }
        
      if (match == "un"){
        return "&";
        }

     
        
    return "Unbekanntes Zeichen";
  }

  
