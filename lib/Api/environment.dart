import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  static String get fileName {
    return ".env";
  }

  static String get baseAPI {
    return dotenv.env["BASE_API"] ?? 'Base API not found';
  }

  static String get baseAPI1 {
    return dotenv.env["BASE_API1"] ?? 'Base API not found';
  }

  static String get version {
    return dotenv.env["Build_Version"] ?? 'Base Version not found';
  }

  static String get versionIos {
    return dotenv.env["IosBuild_Version"] ?? 'Base Version not found';
  }
  static String get dbName {
    return dotenv.env["Data_Base"] ?? 'db Base not found';
  }

}