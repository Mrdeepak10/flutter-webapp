class HomeModel {
  bool? isSucess;
  dynamic count;
  Null prev;
  dynamic current;
  Null next;
  List<Products>? products;
  dynamic status;
  dynamic symbol;

  HomeModel(
      {this.isSucess,
        this.count,
        this.prev,
        this.current,
        this.next,
        this.products,
        this.status,
        this.symbol});

  HomeModel.fromJson(Map<String, dynamic> json) {
    isSucess = json['isSucess'];
    count = json['count'];
    prev = json['prev'];
    current = json['current'];
    next = json['next'];
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
    data['count'] = this.count;
    data['prev'] = this.prev;
    data['current'] = this.current;
    data['next'] = this.next;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['symbol'] = this.symbol;
    return data;
  }
}

class Products {
  List<Banner>? banner;
  List<Executive>? executive;
  List<Category>? category;
  List<Trending>? trending;
  List<Sponsored>? sponsored;
  List<Feature>? feature;
  List<DailyNeed>? dailyNeed;
  List<PromotionalBanner>? promotionalBanner;

  Products(
      {this.banner,
        this.executive,
        this.category,
        this.trending,
        this.sponsored,
        this.feature,
        this.dailyNeed,
        this.promotionalBanner,
      });

  Products.fromJson(Map<String, dynamic> json) {
    if (json['banner'] != null) {
      banner = <Banner>[];
      json['banner'].forEach((v) {
        banner!.add(new Banner.fromJson(v));
      });
    }
    if (json['executive'] != null) {
      executive = <Executive>[];
      json['executive'].forEach((v) {
        executive!.add(new Executive.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }
    if (json['trending'] != null) {
      trending = <Trending>[];
      json['trending'].forEach((v) {
        trending!.add(new Trending.fromJson(v));
      });
    }
    if (json['sponsored'] != null) {
      sponsored = <Sponsored>[];
      json['sponsored'].forEach((v) {
        sponsored!.add(new Sponsored.fromJson(v));
      });
    }
    if (json['feature'] != null) {
      feature = <Feature>[];
      json['feature'].forEach((v) {
        feature!.add(new Feature.fromJson(v));
      });
    }
    if (json['daily_need'] != null) {
      dailyNeed = <DailyNeed>[];
      json['daily_need'].forEach((v) {
        dailyNeed!.add(new DailyNeed.fromJson(v));
      });
    }
    if (json['promotional_banner'] != null) {
      promotionalBanner = <PromotionalBanner>[];
      json['promotional_banner'].forEach((v) {
        promotionalBanner!.add(new PromotionalBanner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.banner != null) {
      data['banner'] = this.banner!.map((v) => v.toJson()).toList();
    }
    if (this.executive != null) {
      data['executive'] = this.executive!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    if (this.trending != null) {
      data['trending'] = this.trending!.map((v) => v.toJson()).toList();
    }
    if (this.sponsored != null) {
      data['sponsored'] = this.sponsored!.map((v) => v.toJson()).toList();
    }
    if (this.feature != null) {
      data['feature'] = this.feature!.map((v) => v.toJson()).toList();
    }
    if (this.dailyNeed != null) {
      data['daily_need'] = this.dailyNeed!.map((v) => v.toJson()).toList();
    }
    if (this.promotionalBanner != null) {
      data['promotional_banner'] = this.promotionalBanner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banner {
  dynamic id;
  dynamic name;

  Banner({this.id, this.name});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}


class PromotionalBanner {
  dynamic id;
  dynamic name;

  PromotionalBanner({this.id, this.name});

  PromotionalBanner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Category {
  dynamic id;
  dynamic name;
  dynamic image;

  Category({this.id, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
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

class Executive {
  dynamic id;
  dynamic name;
  dynamic image;

  Executive({this.id, this.name,this.image});

  Executive.fromJson(Map<String, dynamic> json) {
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

class Trending {
  dynamic id;
  dynamic name;
  dynamic nameInHindi;
  dynamic image;
  dynamic listPrice;
  dynamic mrp;
  dynamic stock;
  dynamic uom;
  dynamic subCategId;
  dynamic description;
 // List<Null>? vendorList;
  dynamic productDetails;
  dynamic isPot;
  dynamic taxAmount;

  Trending(
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
       // this.vendorList,
        this.productDetails,
        this.isPot,
        this.taxAmount
      });

  Trending.fromJson(Map<String, dynamic> json) {
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

class Sponsored {
  dynamic id;
  dynamic name;
  dynamic nameInHindi;
  dynamic image;
  dynamic listPrice;
  dynamic mrp;
  dynamic stock;
  dynamic uom;
  dynamic subCategId;
  dynamic description;
  //List<Null>? vendorList;
  dynamic productDetails;
  dynamic isPot;
  dynamic taxAmount;

  Sponsored(
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
       // this.vendorList,
        this.productDetails,
        this.isPot,
        this.taxAmount,
      });

  Sponsored.fromJson(Map<String, dynamic> json) {
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


class Feature {
  dynamic id;
  dynamic name;
  dynamic nameInHindi;
  dynamic image;
  dynamic listPrice;
  dynamic mrp;
  dynamic stock;
  dynamic uom;
  dynamic subCategId;
  dynamic description;
  //List<Null>? vendorList;
  dynamic productDetails;
  dynamic isPot;
  dynamic taxAmount;

  Feature(
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
       // this.vendorList,
        this.productDetails,
        this.isPot,
        this.taxAmount,
      });

  Feature.fromJson(Map<String, dynamic> json) {
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

class DailyNeed {
  dynamic id;
  dynamic name;
  dynamic nameInHindi;
  dynamic image;
  dynamic listPrice;
  dynamic mrp;
  dynamic stock;
  dynamic uom;
  dynamic subCategId;
  dynamic description;
  //List<Null>? vendorList;
  dynamic productDetails;
  dynamic isPot;
  dynamic taxAmount;

  DailyNeed(
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
       // this.vendorList,
        this.productDetails,
        this.isPot,
        this.taxAmount,
      });

  DailyNeed.fromJson(Map<String, dynamic> json) {
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