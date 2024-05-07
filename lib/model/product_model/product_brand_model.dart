class BrandModel {
  bool? isSucess;
  int? count;
  List<Brands>? brands;
  int? status;

  BrandModel({this.isSucess, this.count, this.brands, this.status});

  BrandModel.fromJson(Map<String, dynamic> json) {
    isSucess = json['isSucess'];
    count = json['count'];
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(new Brands.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSucess'] = this.isSucess;
    data['count'] = this.count;
    if (this.brands != null) {
      data['brands'] = this.brands!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Brands {
  int? id;
  String? name;
  String? image;

  Brands({this.id, this.name, this.image});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
