class PaymentResponseModel {
  bool? isSucess;
  String? message;
  Result? result;
  dynamic status;

  PaymentResponseModel({this.isSucess, this.message, this.result, this.status});

  PaymentResponseModel.fromJson(Map<String, dynamic> json) {
    isSucess = json['isSucess'];
    message = json['message'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSucess'] = this.isSucess;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Result {
  String? id;
  String? entity;
  dynamic amount;
  dynamic amountPaid;
  dynamic amountDue;
  String? currency;
  String? receipt;
  Null offerId;
  String? status;
  dynamic attempts;
  Notes? notes;
  dynamic createdAt;

  Result(
      {this.id,
        this.entity,
        this.amount,
        this.amountPaid,
        this.amountDue,
        this.currency,
        this.receipt,
        this.offerId,
        this.status,
        this.attempts,
        this.notes,
        this.createdAt});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    entity = json['entity'];
    amount = json['amount'];
    amountPaid = json['amount_paid'];
    amountDue = json['amount_due'];
    currency = json['currency'];
    receipt = json['receipt'];
    offerId = json['offer_id'];
    status = json['status'];
    attempts = json['attempts'];
    notes = json['notes'] != null ? new Notes.fromJson(json['notes']) : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['entity'] = this.entity;
    data['amount'] = this.amount;
    data['amount_paid'] = this.amountPaid;
    data['amount_due'] = this.amountDue;
    data['currency'] = this.currency;
    data['receipt'] = this.receipt;
    data['offer_id'] = this.offerId;
    data['status'] = this.status;
    data['attempts'] = this.attempts;
    if (this.notes != null) {
      data['notes'] = this.notes!.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Notes {
  dynamic easternCorianderPowderDhania;

  Notes({this.easternCorianderPowderDhania});

  Notes.fromJson(Map<String, dynamic> json) {
    easternCorianderPowderDhania = json['Eastern Coriander Powder/Dhania'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Eastern Coriander Powder/Dhania'] = this.easternCorianderPowderDhania;
    return data;
  }
}
