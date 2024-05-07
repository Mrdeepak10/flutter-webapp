
class OrderHistoryModel {
  bool? isSucess;
  int? totalCount;
  int? count;
  List<Result>? result;
  int? status;
  int? userId;
  String? message;

  OrderHistoryModel(
      {this.isSucess,
        this.totalCount,
        this.count,
        this.result,
        this.status,
        this.userId,
        this.message});

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    isSucess = json['isSucess'];
    totalCount = json['total_count'];
    count = json['count'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    status = json['status'];
    userId = json['user_id'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSucess'] = this.isSucess;
    data['total_count'] = this.totalCount;
    data['count'] = this.count;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['message'] = this.message;
    return data;
  }
}

class Result {
  int? id;
  String? name;
  String? orderDatetime;
  String? orderDate;

  Result({this.id, this.name, this.orderDatetime, this.orderDate});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    orderDatetime = json['order_datetime'];
    orderDate = json['order_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['order_datetime'] = this.orderDatetime;
    data['order_date'] = this.orderDate;
    return data;
  }
}
