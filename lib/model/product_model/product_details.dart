
class Products {
  int? id;
  String? name;
  String? image;
  dynamic listPrice;
  dynamic stock;
  dynamic actualPrice;
  String? uom;
  dynamic mrp;
  dynamic actualDiscount;
  dynamic taxAmount;
  dynamic actualGst;
  //Price? price;
  //dynamic description;
  //dynamic isInWishList;
  //dynamic ExtraImage;


  Products(
      {this.id,
        this.name,
        this.image,
        this.listPrice,
        this.stock,
        this.uom,
        this.actualPrice,
        this.mrp,
        this.actualDiscount,
        this.taxAmount,
        this.actualGst,
       // this.price,
        // this.description,
        // this.isInWishList,
        // this.ExtraImage,
      });


  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    listPrice = json['list_price'];
    stock = json['stock'];
    uom = json['uom'];
    actualPrice=json['actualPrice'];
    mrp=json['mrp'];
    actualDiscount=json['actualDiscount'];
    taxAmount=json['tax_amount'];
    actualGst=json['actualGst'];
    //price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    // description = json['description'];
    // isInWishList=json['is_in_wishlist'];
    // ExtraImage=json['extra_image'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['list_price'] = this.listPrice;
    data['stock'] = this.stock;
    data['uom'] = this.uom;
    data['actualPrice']=this.actualPrice;
    data['mrp']=this.mrp;
    data['actualDiscount']=this.actualDiscount;
    data['tax_amount']=this.taxAmount;
    data['actualGst']=this.actualGst;
    // if (this.price != null) {
    //   data['price'] = this.price!.toJson();
    // }
    // data['description'] = this.description;
    // data['is_in_wishlist']=this.isInWishList;
    // data['extra_image']=this.ExtraImage;
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