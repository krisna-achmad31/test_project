/// success : true
/// message : "Product loaded successfully"
/// data : [{"id":1,"name":"Rokok 1","qty":1000,"price":10000,"is_active":true,"max_order_qty":null},{"id":2,"name":"Rokok 2","qty":500,"price":13000,"is_active":true,"max_order_qty":10},{"id":3,"name":"Rokok 3","qty":800,"price":19000,"is_active":true,"max_order_qty":null},{"id":4,"name":"Rokok 4","qty":800,"price":14000,"is_active":true,"max_order_qty":null},{"id":6,"name":"Rokok 6","qty":2000,"price":7500,"is_active":true,"max_order_qty":null},{"id":7,"name":"Rokok 7","qty":1000,"price":19000,"is_active":false,"max_order_qty":null},{"id":8,"name":"Rokok 8","qty":1000,"price":15000,"is_active":true,"max_order_qty":null},{"id":9,"name":"Rokok 9","qty":500,"price":15000,"is_active":true,"max_order_qty":null},{"id":10,"name":"Rokok 10","qty":1000,"price":20000,"is_active":true,"max_order_qty":null},{"id":11,"name":"Rokok 11","qty":501,"price":13000,"is_active":true,"max_order_qty":null},{"id":12,"name":"Rokok 12","qty":800,"price":16000,"is_active":true,"max_order_qty":null},{"id":13,"name":"Rokok 13","qty":1000,"price":15000,"is_active":true,"max_order_qty":null},{"id":14,"name":"Rokok 14","qty":1000,"price":10000,"is_active":true,"max_order_qty":null},{"id":15,"name":"Rokok 15","qty":42,"price":30000,"is_active":true,"max_order_qty":null},{"id":16,"name":"Rokok 16","qty":501,"price":50000,"is_active":true,"max_order_qty":null},{"id":17,"name":"Rokok 17","qty":801,"price":19000,"is_active":true,"max_order_qty":null},{"id":18,"name":"Rokok 18","qty":1001,"price":12000,"is_active":true,"max_order_qty":null},{"id":19,"name":"Rokok 19","qty":501,"price":3000,"is_active":true,"max_order_qty":null}]

class Cart {
  Cart({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  Cart.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  String? _message;
  List<Data>? _data;

  bool? get success => _success;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "Rokok 1"
/// qty : 1000
/// price : 10000
/// is_active : true
/// max_order_qty : null

class Data {
  Data({
      num? id,
    num? item,
      String? name, 
      num? qty, 
      num? price, 
      bool? isActive, 
      dynamic maxOrderQty,}){
    _id = id;
    _item = item;
    _name = name;
    _qty = qty;
    _price = price;
    _isActive = isActive;
    _maxOrderQty = maxOrderQty;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _qty = json['qty'];
    _price = json['price'];
    _isActive = json['is_active'];
    _maxOrderQty = json['max_order_qty'] != null ? json['max_order_qty'] : 0;
  }
  num? _id;
  num? _item;
  String? _name;
  num? _qty;
  num? _price;
  bool? _isActive;
  dynamic _maxOrderQty;

  num get id => _id!;
  num get item => _item!;
  String get name => _name!;
  num get qty => _qty!;
  num get price => _price!;
  bool get isActive => _isActive!;
  num get maxOrderQty => _maxOrderQty!;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['item'] = _item;
    map['name'] = _name;
    map['qty'] = _qty;
    map['price'] = _price;
    map['is_active'] = _isActive;
    map['max_order_qty'] = _maxOrderQty;
    return map;
  }

  set id(num value){
    _id = value;
  }

  set item(num newValue){
    _item = newValue;
  }

  set name(String value){
    _name = value;
  }

  set qty(num value){
    _qty = value;
  }

  set price(num value){
    _price = value;
  }

  set isActive(bool value){
    _isActive = value;
  }

  set maxOrderQty(num value){
    _maxOrderQty = value;
  }

}