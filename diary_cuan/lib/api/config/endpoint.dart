class Endpoint{
  //BASE URL
  // 1. Server lumen local
  // static String _baseURL = "http://192.168.43.251:8000";
  // 2. Xampp local
  // static String _baseURL = "http://192.168.43.251/fluttertalk03/public";
  // static String _baseURL = "http://192.168.1.11/fluttertalk03/public";
  // 3. Web server online
  static String _baseURL = "https://financialmanagement.lemonsoda.my.id/public/";

  //END POINT
  static String register = "${_baseURL}/register";
  static String login = "${_baseURL}/authentication";
}