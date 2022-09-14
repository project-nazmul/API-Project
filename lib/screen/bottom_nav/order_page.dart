import 'package:admin/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    var orderList = Provider.of<OrderProvider>(context).orderList;
    var orderProvider = Provider.of<OrderProvider>(context).getOrderData();
    return Scaffold(
      body: orderList.isNotEmpty
          ? SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: orderList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text("${orderList[index].user!.name}"),
                      );
                    })
              ],
            ),
          )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
