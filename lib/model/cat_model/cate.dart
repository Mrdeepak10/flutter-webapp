//
// class CategoryModel {
//   bool? isSucess;
//   dynamic count;
//   List<Result>? result;
//   dynamic totalCount;
//
//
//   CategoryModel({this.isSucess, this.count, this.result, this.totalCount});
//
//
//   CategoryModel.fromJson(Map<String, dynamic> json) {
//     isSucess = json['isSucess'];
//     count = json['count'];
//     if (json['result'] != null) {
//       result = <Result>[];
//       json['result'].forEach((v) {
//         result!.add(new Result.fromJson(v));
//       });
//     }
//     totalCount = json['total_count'];
//   }
//
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['isSucess'] = this.isSucess;
//     data['count'] = this.count;
//     if (this.result != null) {
//       data['result'] = this.result!.map((v) => v.toJson()).toList();
//     }
//     data['total_count'] = this.totalCount;
//     return data;
//   }
// }
//
//
// class Result {
//   int? id;
//   String? name;
//   //dynamic parentId;
//   //dynamic sequence;
//   String? image;
//
//
//   Result({this.id, this.name,
//     //this.parentId,
//     //this.sequence,
//     this.image});
//
//
//   Result.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     //parentId = json['parent_id'];
//     //sequence = json['sequence'];
//     image = json['image'];
//   }
//
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     //data['parent_id'] = this.parentId;
//    // data['sequence'] = this.sequence;
//     data['image'] = this.image;
//     return data;
//   }
// }
//
