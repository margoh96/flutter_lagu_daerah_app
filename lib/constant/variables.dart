class Variables {
  // static const String baseUrl = "http://192.168.1.13:8000";
  // static const String baseUrl =
  // "https://www.dashrels.rexvinapps.my.id"; //ip server
  static const String baseUrl = "http://192.168.1.3:8000";
  static const String imageUrl = '$baseUrl/storage/images/';

  static RegExp phoneRegex = RegExp(r'^\+?\d{9,15}$');
}
