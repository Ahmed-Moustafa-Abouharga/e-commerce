import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHandler{

 static late SharedPreferences sharedPrefrence ;

  static Future<void> init()async
  {
    sharedPrefrence=await SharedPreferences.getInstance();
  }

  static saveToken(String token)
  {
    sharedPrefrence.setString("token", token) ;
  }

  static String getToken()
  {
    return sharedPrefrence.getString("token")??"" ;
  }

  static deleteToken()
  {
     sharedPrefrence.remove("token") ;
  }


}