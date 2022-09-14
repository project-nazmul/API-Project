import 'dart:convert';

import 'package:admin/model/order_model.dart';
import 'package:admin/widget/const.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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

  static Future<Map<String, String>> getHeaderWithToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var header = {
      "Accept": "application/json",
      "Authorization": "bearer ${sharedPreferences.getString("token")}",
    };
    print("user token isssss ${sharedPreferences.getString("token")}");
    return header;
  }

  Future<List<OrderModel>> fetchOrder() async {
    List<OrderModel> orderList = [];
    try {
      var link = "${baseUrl}api/admin/all/orders";
      var responce = await http.get(
          Uri.parse(
            link,
          ),
          headers: await getHeaderWithToken());

      if (responce.statusCode == 200) {
        var data = jsonDecode(responce.body);
        OrderModel orderModel;
        for (var i in data) {
          orderModel = OrderModel.fromJson(i);
          orderList.add(orderModel);
        }
        print("Order Data is ${data}");
        return orderList;
      } else {
        showInToast("Something is wrong bro!");
        return orderList;
      }
    } catch (e) {
      print("Errorrrrrrrrrrrrrr $e");
      return orderList;
    }
  }
}
