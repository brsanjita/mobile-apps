class RemoteConfig {
  static const String CLIENT_TOKEN="clientToken";
  static const String BASE_URL = "https://dev.graph.tribe.cab/query";

  RemoteConfig(String env) {
    if(env == "sandbox") {

    }
  }


  static final Map<dynamic, String> sandboxConfig = {
    "AuthorizationToken": "YOUR_API_KEY",
    "BASE_URL": "http://onappr.herokuapp.com",
    //"BASE_PRODUCTS_URL": "/BASE_PRODUCTS_URL/products/categoryId=1",
  };
}