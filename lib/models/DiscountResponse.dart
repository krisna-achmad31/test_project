/// success : true
/// message : "Discount loaded successfully"
/// data : [{"id":1,"name":"min 15 pack","min_pack":15,"is_active":true,"nominal":100,"start_date":null,"end_date":null},{"id":4,"name":"min 15 pack","min_pack":15,"is_active":true,"nominal":300,"start_date":null,"end_date":null},{"id":8,"name":"min 15 pack","min_pack":15,"is_active":false,"nominal":350,"start_date":null,"end_date":null},{"id":9,"name":"min 15 pack","min_pack":15,"is_active":true,"nominal":400,"start_date":"2023-02-01","end_date":"2023-02-24"},{"id":2,"name":"min 20 pack","min_pack":20,"is_active":true,"nominal":150,"start_date":null,"end_date":null},{"id":3,"name":"min 100 pack","min_pack":100,"is_active":true,"nominal":500,"start_date":null,"end_date":null},{"id":5,"name":"min 500 pack","min_pack":500,"is_active":true,"nominal":500,"start_date":null,"end_date":null},{"id":6,"name":"min 800 pack","min_pack":800,"is_active":true,"nominal":1000,"start_date":null,"end_date":null},{"id":7,"name":"min 1000 pack","min_pack":1000,"is_active":true,"nominal":5000,"start_date":null,"end_date":null}]

class DiscountResponse {
  DiscountResponse({
      bool? success, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _message = message;
    _data = data;
}

  DiscountResponse.fromJson(dynamic json) {
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
/// name : "min 15 pack"
/// min_pack : 15
/// is_active : true
/// nominal : 100
/// start_date : null
/// end_date : null

class Data {
  Data({
      num? id, 
      String? name, 
      num? minPack, 
      bool? isActive, 
      num? nominal, 
      dynamic startDate, 
      dynamic endDate,}){
    _id = id;
    _name = name;
    _minPack = minPack;
    _isActive = isActive;
    _nominal = nominal;
    _startDate = startDate;
    _endDate = endDate;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _minPack = json['min_pack'];
    _isActive = json['is_active'];
    _nominal = json['nominal'];
    _startDate = json['start_date'];
    _endDate = json['end_date'];
  }
  num? _id;
  String? _name;
  num? _minPack;
  bool? _isActive;
  num? _nominal;
  dynamic _startDate;
  dynamic _endDate;

  num? get id => _id;
  String? get name => _name;
  num? get minPack => _minPack;
  bool? get isActive => _isActive;
  num? get nominal => _nominal;
  dynamic get startDate => _startDate;
  dynamic get endDate => _endDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['min_pack'] = _minPack;
    map['is_active'] = _isActive;
    map['nominal'] = _nominal;
    map['start_date'] = _startDate;
    map['end_date'] = _endDate;
    return map;
  }

}