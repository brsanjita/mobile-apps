class RemoteConfig {
  static const String CLIENT_TOKEN="clientToken";
  static const String BASE_URL = "https://dev.graph.tribe.cab/graphql";

  RemoteConfig(String env) {
    if(env == "sandbox") {

    }
  }


  // static final Map<dynamic, String> sandboxConfig = {
  //   "AuthorizationToken": "YOUR_API_KEY",
  //   "BASE_URL": "http://onappr.herokuapp.com",
  // };
}