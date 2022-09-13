import 'package:admin/widget/const.dart';
import 'package:http/http.dart' as http;

class CustomeHttp {
  static const Map<String, String> defaultHeader = {
    "Accept": "application/json",
  };

  static Future<String> login(String email, String password) async {
    try {
      var link = "${baseUrl}api/admin/sign-in";
      var map = Map<String, dynamic>();
      map["email"] = email;
      map["password"] = password;
      final responce = await http.post(
        Uri.parse(link),
        body: map,
        headers: defaultHeader,
      );
      if (responce.statusCode == 200) {
        showInToast("Login Succesfull");
        return responce.body;
      } else {
        showInToast("Invalid email or password");
        print("something is wrong");
        return "something is wronggg";
      }
    } catch (e) {
      return "something is wrong$e";
    }
  }
}
