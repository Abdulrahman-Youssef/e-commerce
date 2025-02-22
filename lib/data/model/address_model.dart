class AddressModel {
  int? addressId;
  int? addressUserId;
  String? addressCity;
  String? addressStreet;
  double? addressLong;
  double? addressLat;
  String? addressName;

  AddressModel(
      {this.addressId,
        this.addressUserId,
        this.addressCity,
        this.addressStreet,
        this.addressLong,
        this.addressLat,
        this.addressName});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUserId = json['address_user_id'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLong = json['address_long'];
    addressLat = json['address_lat'];
    addressName = json['address_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address_id'] = this.addressId;
    data['address_user_id'] = this.addressUserId;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_long'] = this.addressLong;
    data['address_lat'] = this.addressLat;
    data['address_name'] = this.addressName;
    return data;
  }
}
