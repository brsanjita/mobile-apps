import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:common/utils/remote_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:logging/logging.dart';

class TrustedHttp<T> extends http.BaseClient {
  final Logger log = new Logger('TrustedHttp');

  TrustedHttp._internal();

  static final TrustedHttp _singleton = new TrustedHttp._internal();

  factory TrustedHttp() {
    return _singleton;
  }

  //final String knownClientToken;
  static SharedPreferences _preferences;

  //TrustedHttp._internal(this.knownClientToken);

  static Future initTrustedClient() async {
    _preferences = await SharedPreferences.getInstance();
  }

  //Save Token in preferences
  static Future saveToken(String token) async {
    await _preferences.setString(RemoteConfig.CLIENT_TOKEN, token);
  }

  static Future deleteToken() async {
    await _preferences.remove(RemoteConfig.CLIENT_TOKEN);
  }

  static Future<String> getToken() async {
    if(!_preferences.containsKey(RemoteConfig.CLIENT_TOKEN)){
      return null;
    }
    String token=_preferences.getString(RemoteConfig.CLIENT_TOKEN);
    return token;
  }

  static Map<String, String> getAuthorizationHeader() {
    print(_preferences);
    String token = _preferences.getString(RemoteConfig.CLIENT_TOKEN);
    Map<String, String>basic = {"Content-Type": "application/json"};
    if (token == null) {
      basic.putIfAbsent("Authorization", () => "Bearer $token");
    }
    return basic;
  }

  void authenticateUser(String mobile, String otp) {}

  /// The underlying HTTP client.
  http.Client _httpClient = new http.Client();

  //TrustedHttp();

  /// Sends an HTTP request with OAuth2 authorization credentials attached.
  ///
  /// This will also automatically refresh this client's [Credentials] before
  /// sending the request if necessary.
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    //request.headers['authorization'] = "Bearer ${credentials.accessToken}";
    var response = await _httpClient.send(request);

    if (response.statusCode != 401) return response;
    if (!response.headers.containsKey('www-authenticate')) return response;

    return response;
  }

  @override
  Future<http.Response> get(url,
      {Map<String, String> headers, String body}) async {
    if (headers == null) {
      headers = new Map();
    }
    Map<String, String>authorization = getAuthorizationHeader();
    headers.addAll(authorization);
    return super
        .get(url, headers: headers)
        .timeout(const Duration(seconds: 20))
        .then((value) => handleResponse(value));
  }

  @override
  Future<http.Response> post(url,
      {Map<String, String> headers, dynamic body, Encoding encoding}) {
    if (headers == null) {
      headers = new Map();
    }
    Map<String, String>authorization = getAuthorizationHeader();
    headers.addAll(authorization);
    return super
        .post(url, headers: headers, body: body, encoding: encoding,)
        .timeout(const Duration(seconds: 30))
        .then((value) => handleResponse(value));
  }


  http.Response handleResponse(http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode == 401) {
      _preferences.remove(RemoteConfig.CLIENT_TOKEN);
      throw new Exception("Unauthorized");
    } else if (statusCode >= 500) {
      throw new Exception("Error while fetching data");
    }
    return response;
  }

  void close() {
    if (_httpClient != null) _httpClient.close();
    _httpClient = null;
  }
}
