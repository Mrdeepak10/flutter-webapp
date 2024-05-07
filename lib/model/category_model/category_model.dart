class CategoryModel {
  bool? isSucess;
  int? categoryCount;
  List<Category>? category;
  int? status;

  CategoryModel(
      {this.isSucess, this.categoryCount, this.category, this.status});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    isSucess = json['isSucess'];
    categoryCount = json['category_count'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSucess'] = this.isSucess;
    data['category_count'] = this.categoryCount;
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Category {
  int? categoryId;
  String? categoryName;
  dynamic categoryImage;

  Category({this.categoryId, this.categoryName,this.categoryImage});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImage=json['category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['category_image'] =this.categoryImage;
    return data;
  }
}
