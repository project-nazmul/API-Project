import 'package:admin/api_service/custom_api.dart';
import 'package:admin/model/order_model.dart';
import 'package:flutter/material.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> orderList = [];
  getOrderData() async {
    orderList = await CustomeHttp().fetchOrder();
    notifyListeners();
  }
}
