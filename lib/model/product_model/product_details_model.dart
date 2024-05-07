class ProductDetailsModel {
  bool? isSucess;
  int? totalCount;
  int? count;
  Null prev;
  int? current;
  Null next;
  int? totalPages;
  List<Products>? products;
  int? status;
  String? symbol;

  ProductDetailsModel(
      {this.isSucess,
        this.totalCount,
        this.count,
        this.prev,
        this.current,
        this.next,
        this.totalPages,
        this.products,
        this.status,
        this.symbol});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    isSucess = json['isSucess'];
    totalCount = json['total_count'];
    count = json['count'];
    prev = json['prev'];
    current = json['current'];
    next = json['next'];
    totalPages = json['total_pages'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    status = json['status'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSucess'] = this.isSucess;
    data['total_count'] = this.totalCount;
    data['count'] = this.count;
    data['prev'] = this.prev;
    data['current'] = this.current;
    data['next'] = this.next;
    data['total_pages'] = this.totalPages;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['symbol'] = this.symbol;
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? nameInHindi;
  String? image;
  dynamic listPrice;
  dynamic mrp;
  dynamic stock;
  String? uom;
  String? subCategId;
  String? description;
  //List<Null>? vendorList;
  String? productDetails;
  dynamic isPot;
  dynamic taxAmount;

  Products(
      {this.id,
        this.name,
        this.nameInHindi,
        this.image,
        this.listPrice,
        this.mrp,
        this.stock,
        this.uom,
        this.subCategId,
        this.description,
        //this.vendorList,
        this.productDetails,
        this.isPot,
        this.taxAmount,
      });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameInHindi = json['name_in_hindi'];
    image = json['image'];
    listPrice = json['list_price'];
    mrp = json['mrp'];
    stock = json['stock'];
    uom = json['uom'];
    subCategId = json['sub_categ_id'];
    description = json['description'];
    // if (json['vendor_list'] != null) {
    //   vendorList = <Null>[];
    //   json['vendor_list'].forEach((v) {
    //     vendorList!.add(new Null.fromJson(v));
    //   });
    // }
    productDetails = json['product_details'];
    isPot=json['is_pot'];
    taxAmount=json['tax_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_in_hindi'] = this.nameInHindi;
    data['image'] = this.image;
    data['list_price'] = this.listPrice;
    data['mrp'] = this.mrp;
    data['stock'] = this.stock;
    data['uom'] = this.uom;
    data['sub_categ_id'] = this.subCategId;
    data['description'] = this.description;
    // if (this.vendorList != null) {
    //   data['vendor_list'] = this.vendorList!.map((v) => v.toJson()).toList();
    // }
    data['product_details'] = this.productDetails;
    data['is_pot']=this.isPot;
    data['tax_amount']=this.taxAmount;
    return data;
  }
}
