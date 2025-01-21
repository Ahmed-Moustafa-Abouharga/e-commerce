class AppValidator{
  static String? validateFullName(String? name)
  {
    if(name ==null || name.isEmpty)
      {
        return "This field is required" ;
      }
    else {
      return null;
    }
  }

  static String? validateEmail (String? value)
  {
    RegExp emailRegEx =RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+") ;
    if (value == null ||value.isEmpty)
      {
        return "This field is required" ;
      }
    else if(emailRegEx.hasMatch(value)==false)
      {
        return "Enter valid Email" ;
      }
    else return null;
  }
  static String? validatePassword(String? password)
  {
    if(password ==null || password.isEmpty)
      {
        return 'This Field is required' ;
      }
   else if(password.length<8)
      {
        return "short password should be at least 8 chars" ;
      }
   else return null;
  }
  static String? validatePhone(String? number)
  {
    if( number ==null || number.isEmpty)
      {
        return "This Field is required" ;
      }
   else if(number.length !=11)
      {
        return "Phone number must be 11 numbers" ;
      }
else return null;
  }
 }