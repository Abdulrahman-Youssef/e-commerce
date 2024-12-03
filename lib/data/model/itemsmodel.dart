class ItemsModel {
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
  int? categoriesId;
  String? categoriesName;
  String? categoriesCreationdate;
  String? categoriesImage;
  int? favorite;

  ItemsModel(
      {this.itemsId,
        this.itemsName,
        this.itemsDescription,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsCategory,
        this.categoriesId,
        this.categoriesName,
        this.categoriesCreationdate,
        this.categoriesImage,
        this.favorite});

  ItemsModel.fromJson(Map<String, dynamic> json) {
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
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesCreationdate = json['categories_creationdate'];
    categoriesImage = json['categories_image'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_creationdate'] = this.categoriesCreationdate;
    data['categories_image'] = this.categoriesImage;
    data['favorite'] = this.favorite;
    return data;
  }
}