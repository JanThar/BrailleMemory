String rewriteType (byte arr[])
{
    char buff[1];
    String res ;

    res = res + (char )arr[0];
    return res;
  }

  String rewriteId (byte arr[])
{
    char buff[1];
    String res ;

    res = res + (char )arr[1] + (char )arr[2];
    return res;
  }

  

   String rewriteplayer (byte arr[])
  {
    char buff[1];
    String res ;

    res = res + (char )arr[1];
    return res;
  }


  String rewriteoperator (byte arr[])
  {
    char buff[1];
    String res ;

    res = res + (char )arr[2];
    return res;
  }
