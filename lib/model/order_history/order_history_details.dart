class OrderHistoryDetailsModel {
  bool? isSucess;
  Result? result;
  int? status;

  OrderHistoryDetailsModel({this.isSucess, this.result, this.status});

  OrderHistoryDetailsModel.fromJson(Map<String, dynamic> json) {
    isSucess = json['isSucess'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSucess'] = this.isSucess;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Result {
  int? id;
  String? name;
  List<OrderLine>? orderLine;
  int? partnerId;
  PartnerAddress? partnerAddress;
  String? partnerShippingId;
  String? dateOrder;
  String? state;
  int? amountUntaxed;
  int? amountTax;
  int? amountTotal;
  String? symbol;
  String? feedback;
  String? saleExecutiveName;
  bool? isReturn;
  bool? isOrderConfirm;
  String? saleStatus;
  int? lat;
  int? long;
  String? areaName;
  String? parentAreaName;
  int? deliveryCharge;
  String? orderFrom;
  int? discount;
  int? retailerId;
  String? retailerName;
  String? retailerAddress;
  String? paymentId;
  bool? isPaymentDone;

  Result(
      {this.id,
        this.name,
        this.orderLine,
        this.partnerId,
        this.partnerAddress,
        this.partnerShippingId,
        this.dateOrder,
        this.state,
        this.amountUntaxed,
        this.amountTax,
        this.amountTotal,
        this.symbol,
        this.feedback,
        this.saleExecutiveName,
        this.isReturn,
        this.isOrderConfirm,
        this.saleStatus,
        this.lat,
        this.long,
        this.areaName,
        this.parentAreaName,
        this.deliveryCharge,
        this.orderFrom,
        this.discount,
        this.retailerId,
        this.retailerName,
        this.retailerAddress,
        this.paymentId,
        this.isPaymentDone});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['order_line'] != null) {
      orderLine = <OrderLine>[];
      json['order_line'].forEach((v) {
        orderLine!.add(new OrderLine.fromJson(v));
      });
    }
    partnerId = json['partner_id'];
    partnerAddress = json['partner_address'] != null
        ? new PartnerAddress.fromJson(json['partner_address'])
        : null;
    partnerShippingId = json['partner_shipping_id'];
    dateOrder = json['date_order'];
    state = json['state'];
    amountUntaxed = json['amount_untaxed'];
    amountTax = json['amount_tax'];
    amountTotal = json['amount_total'];
    symbol = json['symbol'];
    feedback = json['feedback'];
    saleExecutiveName = json['sale_executive_name'];
    isReturn = json['is_return'];
    isOrderConfirm = json['is_order_confirm'];
    saleStatus = json['sale_status'];
    lat = json['lat'];
    long = json['long'];
    areaName = json['area_name'];
    parentAreaName = json['parent_area_name'];
    deliveryCharge = json['delivery_charge'];
    orderFrom = json['order_from'];
    discount = json['discount'];
    retailerId = json['retailer_id'];
    retailerName = json['retailer_name'];
    retailerAddress = json['retailer_address'];
    paymentId = json['payment_id'];
    isPaymentDone = json['is_payment_done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.orderLine != null) {
      data['order_line'] = this.orderLine!.map((v) => v.toJson()).toList();
    }
    data['partner_id'] = this.partnerId;
    if (this.partnerAddress != null) {
      data['partner_address'] = this.partnerAddress!.toJson();
    }
    data['partner_shipping_id'] = this.partnerShippingId;
    data['date_order'] = this.dateOrder;
    data['state'] = this.state;
    data['amount_untaxed'] = this.amountUntaxed;
    data['amount_tax'] = this.amountTax;
    data['amount_total'] = this.amountTotal;
    data['symbol'] = this.symbol;
    data['feedback'] = this.feedback;
    data['sale_executive_name'] = this.saleExecutiveName;
    data['is_return'] = this.isReturn;
    data['is_order_confirm'] = this.isOrderConfirm;
    data['sale_status'] = this.saleStatus;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['area_name'] = this.areaName;
    data['parent_area_name'] = this.parentAreaName;
    data['delivery_charge'] = this.deliveryCharge;
    data['order_from'] = this.orderFrom;
    data['discount'] = this.discount;
    data['retailer_id'] = this.retailerId;
    data['retailer_name'] = this.retailerName;
    data['retailer_address'] = this.retailerAddress;
    data['payment_id'] = this.paymentId;
    data['is_payment_done'] = this.isPaymentDone;
    return data;
  }
}

class OrderLine {
  int? id;
  String? name;
  String? productImage;
  int? productId;
  String? productName;
  String? productNameInHindi;
  int? priceUnit;
  int? priceSubtotal;
  int? priceTax;
  int? priceTotal;
 // List<Null>? taxId;
  int? quantity;
  int? qtyDelivered;
  int? qtyInvoiced;
  int? stock;
  String? feedback;
  String? packingStatus;
  String? uomName;
  int? actualQtyPack;
  String? productType;

  OrderLine(
      {this.id,
        this.name,
        this.productImage,
        this.productId,
        this.productName,
        this.productNameInHindi,
        this.priceUnit,
        this.priceSubtotal,
        this.priceTax,
        this.priceTotal,
       // this.taxId,
        this.quantity,
        this.qtyDelivered,
        this.qtyInvoiced,
        this.stock,
        this.feedback,
        this.packingStatus,
        this.uomName,
        this.actualQtyPack,
        this.productType});

  OrderLine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productImage = json['product_image'];
    productId = json['product_id'];
    productName = json['product_name'];
    productNameInHindi = json['product_name_in_hindi'];
    priceUnit = json['price_unit'];
    priceSubtotal = json['price_subtotal'];
    priceTax = json['price_tax'];
    priceTotal = json['price_total'];
    // if (json['tax_id'] != null) {
    //   taxId = <Null>[];
    //   json['tax_id'].forEach((v) {
    //     taxId!.add(new Null.fromJson(v));
    //   });
    // }
    quantity = json['quantity'];
    qtyDelivered = json['qty_delivered'];
    qtyInvoiced = json['qty_invoiced'];
    stock = json['stock'];
    feedback = json['feedback'];
    packingStatus = json['packing_status'];
    uomName = json['uom_name'];
    actualQtyPack = json['actual_qty_pack'];
    productType = json['product_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['product_image'] = this.productImage;
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
    data['product_name_in_hindi'] = this.productNameInHindi;
    data['price_unit'] = this.priceUnit;
    data['price_subtotal'] = this.priceSubtotal;
    data['price_tax'] = this.priceTax;
    data['price_total'] = this.priceTotal;
    // if (this.taxId != null) {
    //   data['tax_id'] = this.taxId!.map((v) => v.toJson()).toList();
    // }
    data['quantity'] = this.quantity;
    data['qty_delivered'] = this.qtyDelivered;
    data['qty_invoiced'] = this.qtyInvoiced;
    data['stock'] = this.stock;
    data['feedback'] = this.feedback;
    data['packing_status'] = this.packingStatus;
    data['uom_name'] = this.uomName;
    data['actual_qty_pack'] = this.actualQtyPack;
    data['product_type'] = this.productType;
    return data;
  }
}

class PartnerAddress {
  int? id;
  String? name;
  String? phone;
  String? mobile;
  String? email;
  String? street;
  String? street2;
  String? city;
  String? stateId;
  String? stateName;
  String? zip;
  String? countryId;
  String? countryName;
  String? website;
  String? image;

  PartnerAddress(
      {this.id,
        this.name,
        this.phone,
        this.mobile,
        this.email,
        this.street,
        this.street2,
        this.city,
        this.stateId,
        this.stateName,
        this.zip,
        this.countryId,
        this.countryName,
        this.website,
        this.image});

  PartnerAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    mobile = json['mobile'];
    email = json['email'];
    street = json['street'];
    street2 = json['street2'];
    city = json['city'];
    stateId = json['state_id'];
    stateName = json['state_name'];
    zip = json['zip'];
    countryId = json['country_id'];
    countryName = json['country_name'];
    website = json['website'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['street'] = this.street;
    data['street2'] = this.street2;
    data['city'] = this.city;
    data['state_id'] = this.stateId;
    data['state_name'] = this.stateName;
    data['zip'] = this.zip;
    data['country_id'] = this.countryId;
    data['country_name'] = this.countryName;
    data['website'] = this.website;
    data['image'] = this.image;
    return data;
  }
}




// class OrderHistoryDetailsModel {
//   bool? isSucess;
//   Result? result;
//   dynamic status;
//
//   OrderHistoryDetailsModel({this.isSucess, this.result, this.status});
//
//   OrderHistoryDetailsModel.fromJson(Map<String, dynamic> json) {
//     isSucess = json['isSucess'];
//     result = json['result'] != null ? new Result.fromJson(json['result']) : null;
//     status = json['status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['isSucess'] = this.isSucess;
//     if (this.result != null) {
//       data['result'] = this.result!.toJson();
//     }
//     data['status'] = this.status;
//     return data;
//   }
// }
//
// class Result {
//   dynamic id;
//   dynamic name;
//   List<OrderLine>? orderLine;
//   dynamic partnerId;
//   PartnerAddress? partnerAddress;
//   PartnerAddress? partnerShippingId;
//   dynamic dateOrder;
//   dynamic state;
//   dynamic amountUntaxed;
//   dynamic amountTax;
//   dynamic amountTotal;
//   dynamic symbol;
//   dynamic feedback;
//   dynamic saleExecutiveName;
//   bool? isReturn;
//   bool? isOrderConfirm;
//   dynamic saleStatus;
//   dynamic lat;
//   dynamic long;
//   dynamic areaName;
//   dynamic parentAreaName;
//   dynamic deliveryCharge;
//   dynamic orderFrom;
//   dynamic discount;
//   bool? retailerId;
//   dynamic retailerName;
//   //RetailerAddress? retailerAddress;
//   dynamic paymentId;
//   bool? isPaymentDone;
//
//   Result({this.id, this.name, this.orderLine, this.partnerId, this.partnerAddress, this.partnerShippingId, this.dateOrder, this.state, this.amountUntaxed, this.amountTax, this.amountTotal, this.symbol, this.feedback, this.saleExecutiveName, this.isReturn, this.isOrderConfirm, this.saleStatus, this.lat, this.long, this.areaName, this.parentAreaName, this.deliveryCharge, this.orderFrom, this.discount, this.retailerId, this.retailerName,
//     //this.retailerAddress,
//     this.paymentId, this.isPaymentDone});
//
//   Result.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     if (json['order_line'] != null) {
//       orderLine = <OrderLine>[];
//       json['order_line'].forEach((v) { orderLine!.add(new OrderLine.fromJson(v)); });
//     }
//     partnerId = json['partner_id'];
//     partnerAddress = json['partner_address'] != null ? new PartnerAddress.fromJson(json['partner_address']) : null;
//     partnerShippingId = json['partner_shipping_id'] != null ? new PartnerAddress.fromJson(json['partner_shipping_id']) : null;
//     dateOrder = json['date_order'];
//     state = json['state'];
//     amountUntaxed = json['amount_untaxed'];
//     amountTax = json['amount_tax'];
//     amountTotal = json['amount_total'];
//     symbol = json['symbol'];
//     feedback = json['feedback'];
//     saleExecutiveName = json['sale_executive_name'];
//     isReturn = json['is_return'];
//     isOrderConfirm = json['is_order_confirm'];
//     saleStatus = json['sale_status'];
//     lat = json['lat'];
//     long = json['long'];
//     areaName = json['area_name'];
//     parentAreaName = json['parent_area_name'];
//     deliveryCharge = json['delivery_charge'];
//     orderFrom = json['order_from'];
//     discount = json['discount'];
//     retailerId = json['retailer_id'];
//     retailerName = json['retailer_name'];
//     //retailerAddress = json['retailer_address'] != null ? new RetailerAddress.fromJson(json['retailer_address']) : null;
//     paymentId = json['payment_id'];
//     isPaymentDone = json['is_payment_done'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     if (this.orderLine != null) {
//       data['order_line'] = this.orderLine!.map((v) => v.toJson()).toList();
//     }
//     data['partner_id'] = this.partnerId;
//     if (this.partnerAddress != null) {
//       data['partner_address'] = this.partnerAddress!.toJson();
//     }
//     if (this.partnerShippingId != null) {
//       data['partner_shipping_id'] = this.partnerShippingId!.toJson();
//     }
//     data['date_order'] = this.dateOrder;
//     data['state'] = this.state;
//     data['amount_untaxed'] = this.amountUntaxed;
//     data['amount_tax'] = this.amountTax;
//     data['amount_total'] = this.amountTotal;
//     data['symbol'] = this.symbol;
//     data['feedback'] = this.feedback;
//     data['sale_executive_name'] = this.saleExecutiveName;
//     data['is_return'] = this.isReturn;
//     data['is_order_confirm'] = this.isOrderConfirm;
//     data['sale_status'] = this.saleStatus;
//     data['lat'] = this.lat;
//     data['long'] = this.long;
//     data['area_name'] = this.areaName;
//     data['parent_area_name'] = this.parentAreaName;
//     data['delivery_charge'] = this.deliveryCharge;
//     data['order_from'] = this.orderFrom;
//     data['discount'] = this.discount;
//     data['retailer_id'] = this.retailerId;
//     data['retailer_name'] = this.retailerName;
//     // if (this.retailerAddress != null) {
//     //   data['retailer_address'] = this.retailerAddress!.toJson();
//     // }
//     data['payment_id'] = this.paymentId;
//     data['is_payment_done'] = this.isPaymentDone;
//     return data;
//   }
// }
//
// class OrderLine {
//   dynamic id;
//   dynamic name;
//   dynamic productImage;
//   dynamic productId;
//   dynamic productName;
//   dynamic productNameInHindi;
//   dynamic priceUnit;
//   dynamic priceSubtotal;
//   dynamic priceTax;
//   dynamic priceTotal;
//   //List<Null>? taxId;
//   dynamic quantity;
//   dynamic qtyDelivered;
//   dynamic qtyInvoiced;
//   dynamic stock;
//   dynamic feedback;
//   dynamic packingStatus;
//   dynamic uomName;
//   dynamic actualQtyPack;
//   dynamic productType;
//
//   OrderLine({this.id, this.name, this.productImage, this.productId, this.productName, this.productNameInHindi, this.priceUnit, this.priceSubtotal, this.priceTax, this.priceTotal,
//     //this.taxId,
//     this.quantity, this.qtyDelivered, this.qtyInvoiced, this.stock, this.feedback, this.packingStatus, this.uomName, this.actualQtyPack, this.productType});
//
//   OrderLine.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     productImage = json['product_image'];
//     productId = json['product_id'];
//     productName = json['product_name'];
//     productNameInHindi = json['product_name_in_hindi'];
//     priceUnit = json['price_unit'];
//     priceSubtotal = json['price_subtotal'];
//     priceTax = json['price_tax'];
//     priceTotal = json['price_total'];
//     // if (json['tax_id'] != null) {
//     //   taxId = <Null>[];
//     //   json['tax_id'].forEach((v) { taxId!.add(new Null.fromJson(v)); });
//     // }
//     quantity = json['quantity'];
//     qtyDelivered = json['qty_delivered'];
//     qtyInvoiced = json['qty_invoiced'];
//     stock = json['stock'];
//     feedback = json['feedback'];
//     packingStatus = json['packing_status'];
//     uomName = json['uom_name'];
//     actualQtyPack = json['actual_qty_pack'];
//     productType = json['product_type'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['product_image'] = this.productImage;
//     data['product_id'] = this.productId;
//     data['product_name'] = this.productName;
//     data['product_name_in_hindi'] = this.productNameInHindi;
//     data['price_unit'] = this.priceUnit;
//     data['price_subtotal'] = this.priceSubtotal;
//     data['price_tax'] = this.priceTax;
//     data['price_total'] = this.priceTotal;
//     // if (this.taxId != null) {
//     //   data['tax_id'] = this.taxId!.map((v) => v.toJson()).toList();
//     // }
//     data['quantity'] = this.quantity;
//     data['qty_delivered'] = this.qtyDelivered;
//     data['qty_invoiced'] = this.qtyInvoiced;
//     data['stock'] = this.stock;
//     data['feedback'] = this.feedback;
//     data['packing_status'] = this.packingStatus;
//     data['uom_name'] = this.uomName;
//     data['actual_qty_pack'] = this.actualQtyPack;
//     data['product_type'] = this.productType;
//     return data;
//   }
// }
//
// class PartnerAddress {
//   dynamic id;
//   dynamic name;
//   dynamic phone;
//   dynamic mobile;
//   dynamic email;
//   dynamic street;
//   dynamic street2;
//   dynamic city;
//   dynamic stateId;
//   dynamic stateName;
//   dynamic zip;
//   dynamic countryId;
//   dynamic countryName;
//   dynamic website;
//   dynamic image;
//
//   PartnerAddress({this.id, this.name, this.phone, this.mobile, this.email, this.street, this.street2, this.city, this.stateId, this.stateName, this.zip, this.countryId, this.countryName, this.website, this.image});
//
//   PartnerAddress.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     phone = json['phone'];
//     mobile = json['mobile'];
//     email = json['email'];
//     street = json['street'];
//     street2 = json['street2'];
//     city = json['city'];
//     stateId = json['state_id'];
//     stateName = json['state_name'];
//     zip = json['zip'];
//     countryId = json['country_id'];
//     countryName = json['country_name'];
//     website = json['website'];
//     image = json['image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['phone'] = this.phone;
//     data['mobile'] = this.mobile;
//     data['email'] = this.email;
//     data['street'] = this.street;
//     data['street2'] = this.street2;
//     data['city'] = this.city;
//     data['state_id'] = this.stateId;
//     data['state_name'] = this.stateName;
//     data['zip'] = this.zip;
//     data['country_id'] = this.countryId;
//     data['country_name'] = this.countryName;
//     data['website'] = this.website;
//     data['image'] = this.image;
//     return data;
//   }
// }
//
// // class RetailerAddress {
// //
// //
// //   RetailerAddress({});
// //
// // RetailerAddress.fromJson(Map<String, dynamic> json) {
// // }
// //
// // Map<String, dynamic> toJson() {
// // final Map<String, dynamic> data = new Map<String, dynamic>();
// // return data;
// // }
// // }
//
// // class Result {
// // dynamic id;
// // dynamic name;
// // List<OrderLine>? orderLine;
// // dynamic partnerId;
// // PartnerAddress? partnerAddress;
// // PartnerAddress? partnerShippingId;
// // dynamic dateOrder;
// // dynamic state;
// // dynamic amountUntaxed;
// // dynamic amountTax;
// // dynamic amountTotal;
// // dynamic symbol;
// // dynamic feedback;
// // dynamic saleExecutiveName;
// // bool? isReturn;
// // bool? isOrderConfirm;
// // dynamic saleStatus;
// // dynamic lat;
// // dynamic long;
// // dynamic areaName;
// // dynamic parentAreaName;
// // dynamic deliveryCharge;
// // dynamic orderFrom;
// // dynamic discount;
// // bool? retailerId;
// // dynamic retailerName;
// // RetailerAddress? retailerAddress;
// // dynamic paymentId;
// // bool? isPaymentDone;
// //
// // Result({this.id, this.name, this.orderLine, this.partnerId, this.partnerAddress, this.partnerShippingId, this.dateOrder, this.state, this.amountUntaxed, this.amountTax, this.amountTotal, this.symbol, this.feedback, this.saleExecutiveName, this.isReturn, this.isOrderConfirm, this.saleStatus, this.lat, this.long, this.areaName, this.parentAreaName, this.deliveryCharge, this.orderFrom, this.discount, this.retailerId, this.retailerName, this.retailerAddress, this.paymentId, this.isPaymentDone});
// //
// // Result.fromJson(Map<String, dynamic> json) {
// // id = json['id'];
// // name = json['name'];
// // if (json['order_line'] != null) {
// // orderLine = <OrderLine>[];
// // json['order_line'].forEach((v) { orderLine!.add(new OrderLine.fromJson(v)); });
// // }
// // partnerId = json['partner_id'];
// // partnerAddress = json['partner_address'] != null ? new PartnerAddress.fromJson(json['partner_address']) : null;
// // partnerShippingId = json['partner_shipping_id'] != null ? new PartnerAddress.fromJson(json['partner_shipping_id']) : null;
// // dateOrder = json['date_order'];
// // state = json['state'];
// // amountUntaxed = json['amount_untaxed'];
// // amountTax = json['amount_tax'];
// // amountTotal = json['amount_total'];
// // symbol = json['symbol'];
// // feedback = json['feedback'];
// // saleExecutiveName = json['sale_executive_name'];
// // isReturn = json['is_return'];
// // isOrderConfirm = json['is_order_confirm'];
// // saleStatus = json['sale_status'];
// // lat = json['lat'];
// // long = json['long'];
// // areaName = json['area_name'];
// // parentAreaName = json['parent_area_name'];
// // deliveryCharge = json['delivery_charge'];
// // orderFrom = json['order_from'];
// // discount = json['discount'];
// // retailerId = json['retailer_id'];
// // retailerName = json['retailer_name'];
// // retailerAddress = json['retailer_address'] != null ? new RetailerAddress.fromJson(json['retailer_address']) : null;
// // paymentId = json['payment_id'];
// // isPaymentDone = json['is_payment_done'];
// // }
// //
// // Map<String, dynamic> toJson() {
// // final Map<String, dynamic> data = new Map<String, dynamic>();
// // data['id'] = this.id;
// // data['name'] = this.name;
// // if (this.orderLine != null) {
// // data['order_line'] = this.orderLine!.map((v) => v.toJson()).toList();
// // }
// // data['partner_id'] = this.partnerId;
// // if (this.partnerAddress != null) {
// // data['partner_address'] = this.partnerAddress!.toJson();
// // }
// // if (this.partnerShippingId != null) {
// // data['partner_shipping_id'] = this.partnerShippingId!.toJson();
// // }
// // data['date_order'] = this.dateOrder;
// // data['state'] = this.state;
// // data['amount_untaxed'] = this.amountUntaxed;
// // data['amount_tax'] = this.amountTax;
// // data['amount_total'] = this.amountTotal;
// // data['symbol'] = this.symbol;
// // data['feedback'] = this.feedback;
// // data['sale_executive_name'] = this.saleExecutiveName;
// // data['is_return'] = this.isReturn;
// // data['is_order_confirm'] = this.isOrderConfirm;
// // data['sale_status'] = this.saleStatus;
// // data['lat'] = this.lat;
// // data['long'] = this.long;
// // data['area_name'] = this.areaName;
// // data['parent_area_name'] = this.parentAreaName;
// // data['delivery_charge'] = this.deliveryCharge;
// // data['order_from'] = this.orderFrom;
// // data['discount'] = this.discount;
// // data['retailer_id'] = this.retailerId;
// // data['retailer_name'] = this.retailerName;
// // if (this.retailerAddress != null) {
// // data['retailer_address'] = this.retailerAddress!.toJson();
// // }
// // data['payment_id'] = this.paymentId;
// // data['is_payment_done'] = this.isPaymentDone;
// // return data;
// // }
// // }
