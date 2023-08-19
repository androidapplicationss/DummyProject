library my_project.globals;
bool isDevelopment = true;

class Config {
  static const String devBaseUrl = 'http://172.30.109.162:9090/successPath/api';
  static const String stagingBaseUrl = 'http://172.30.109.162:8080/successPath/api';
  String get baseUrl {
    if (isDevelopment) {
      return devBaseUrl;
    } else  {
      return stagingBaseUrl;
    }
  }
}
