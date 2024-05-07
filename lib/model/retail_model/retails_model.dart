class RetailsModel {
  bool? isSucess;
  int? count;
  List<Result>? result;

  RetailsModel({this.isSucess, this.count, this.result});

  RetailsModel.fromJson(Map<String, dynamic> json) {
    isSucess = json['isSucess'];
    count = json['count'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSucess'] = this.isSucess;
    data['count'] = this.count;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? id;
  String? name;
  String? address;
  String? mobile;

  Result({this.id, this.name, this.address, this.mobile});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['mobile'] = this.mobile;
    return data;
  }
}
