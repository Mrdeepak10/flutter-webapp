class ProductModel {
  bool? isSucess;
  dynamic totalCount;
  dynamic count;
  List<Products>? products;
  int? status;
  String? symbol;


  ProductModel(
      {this.isSucess,
        this.totalCount,
        this.count,
        this.products,
        this.status,
        this.symbol});


  ProductModel.fromJson(Map<String, dynamic> json) {
    isSucess = json['isSucess'];
    totalCount = json['total_count'];
    count = json['count'];
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
  String? image;
  dynamic listPrice;
  dynamic stock;
  String? uom;
  Price? price;
  dynamic description;
  dynamic isInWishList;
  dynamic ExtraImage;
  dynamic taxAmount;


  Products(
      {this.id,
        this.name,
        this.image,
        this.listPrice,
        this.stock,
        this.uom,
        this.price,
        this.description,
        this.isInWishList,
        this.ExtraImage,
        this.taxAmount,
      });


  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    listPrice = json['list_price'];
    stock = json['stock'];
    uom = json['uom'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    description = json['description'];
    isInWishList=json['is_in_wishlist'];
    ExtraImage=json['extra_image'];
    taxAmount=json['tax_amount'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['list_price'] = this.listPrice;
    data['stock'] = this.stock;
    data['uom'] = this.uom;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['description'] = this.description;
    data['is_in_wishlist']=this.isInWishList;
    data['extra_image']=this.ExtraImage;
    data['tax_amount']=this.taxAmount;
    return data;
  }
}


class Price {
  dynamic price;
  dynamic listPrice;
  dynamic priceExtra;


  Price({this.price, this.listPrice, this.priceExtra});


  Price.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    listPrice = json['list_price'];
    priceExtra = json['price_extra'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['list_price'] = this.listPrice;
    data['price_extra'] = this.priceExtra;
    return data;
  }
}

