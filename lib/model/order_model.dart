class OrderModel {
  OrderModel({
      this.id, 
      this.quantity, 
      this.price, 
      this.discount, 
      this.vat, 
      this.orderDateAndTime, 
      this.user, 
      this.payment, 
      this.orderStatus,});

  OrderModel.fromJson(dynamic json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    discount = json['discount'];
    vat = json['VAT'];
    orderDateAndTime = json['order_date_and_time'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    payment = json['payment'] != null ? Payment.fromJson(json['payment']) : null;
    orderStatus = json['order_status'] != null ? OrderStatus.fromJson(json['order_status']) : null;
  }
  int? id;
  int? quantity;
  int? price;
  dynamic discount;
  dynamic vat;
  String? orderDateAndTime;
  User? user;
  Payment? payment;
  OrderStatus? orderStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['quantity'] = quantity;
    map['price'] = price;
    map['discount'] = discount;
    map['VAT'] = vat;
    map['order_date_and_time'] = orderDateAndTime;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    if (payment != null) {
      map['payment'] = payment?.toJson();
    }
    if (orderStatus != null) {
      map['order_status'] = orderStatus?.toJson();
    }
    return map;
  }

}

class OrderStatus {
  OrderStatus({
      this.orderStatusCategory,});

  OrderStatus.fromJson(dynamic json) {
    orderStatusCategory = json['order_status_category'] != null ? OrderStatusCategory.fromJson(json['order_status_category']) : null;
  }
  OrderStatusCategory? orderStatusCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (orderStatusCategory != null) {
      map['order_status_category'] = orderStatusCategory?.toJson();
    }
    return map;
  }

}

class OrderStatusCategory {
  OrderStatusCategory({
      this.id, 
      this.name,});

  OrderStatusCategory.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}

class Payment {
  Payment({
      this.paymentStatus,});

  Payment.fromJson(dynamic json) {
    paymentStatus = json['payment_status'];
  }
  int? paymentStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['payment_status'] = paymentStatus;
    return map;
  }

}

class User {
  User({
      this.id, 
      this.name,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}