class CartItem {
  int? cartID;
  int? cartUserId;
  int? cartItemId;
  int? itemsId;
  String? itemsName;
  String? itemsDescription;
  String? itemsImage;
  int? itemsCount;
  int? itemsActive;
  int? itemsPrice;
  int? itemsDiscount;
  String? itemsDate;
  int? itemsCategory;

  CartItem(
      {this.cartID,
        this.cartUserId,
        this.cartItemId,
        this.itemsId,
        this.itemsName,
        this.itemsDescription,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsCategory});

  CartItem.fromJson(Map<String, dynamic> json) {
    cartID = json['cart_ID'];
    cartUserId = json['cart_user_id'];
    cartItemId = json['cart_item_id'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsDescription = json['items_description'];
    itemsImage = json['items_image'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsCategory = json['items_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_ID'] = this.cartID;
    data['cart_user_id'] = this.cartUserId;
    data['cart_item_id'] = this.cartItemId;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_description'] = this.itemsDescription;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_date'] = this.itemsDate;
    data['items_category'] = this.itemsCategory;
    return data;
  }
}