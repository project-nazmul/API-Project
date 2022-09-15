import 'package:admin/providers/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orderList = Provider.of<OrderProvider>(context).orderList;
    Provider.of<OrderProvider>(context).getOrderData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
        centerTitle: true,
      ),
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

