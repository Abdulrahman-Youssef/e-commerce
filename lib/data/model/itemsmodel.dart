class ItemsModel {
  final int itemsId;
  final String itemsName;
  final String itemsDescription;
  final String itemsImage;
  final int itemsCount;
  final bool itemsActive;
  final double itemsPrice;
  final int itemsDiscount;
  final DateTime itemsDate;
  final int itemsCategory;
  final int categoriesId;
  final String categoriesName;
  final DateTime categoriesCreationDate;
  final String categoriesImage;

  // Constructor
  ItemsModel({
    required this.itemsId,
    required this.itemsName,
    required this.itemsDescription,
    required this.itemsImage,
    required this.itemsCount,
    required this.itemsActive,
    required this.itemsPrice,
    required this.itemsDiscount,
    required this.itemsDate,
    required this.itemsCategory,
    required this.categoriesId,
    required this.categoriesName,
    required this.categoriesCreationDate,
    required this.categoriesImage,
  });

  // Factory constructor to create an Item instance from JSON
  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      itemsId: json['items_id'] as int,
      itemsName: json['items_name'] as String,
      itemsDescription: json['items_description'] as String,
      itemsImage: json['items_image'] as String,
      itemsCount: int.parse(json['items_count'] as String),
      itemsActive: json['items_active'] == 1,
      itemsPrice: double.parse(json['items_price'] as String),
      itemsDiscount: json['items_discount'] as int,
      itemsDate: DateTime.parse(json['items_date'] as String),
      itemsCategory: json['items_catigoray'] as int,
      categoriesId: json['categories_id'] as int,
      categoriesName: json['categories_name'] as String,
      categoriesCreationDate: DateTime.parse(json['categories_creationdate'] as String),
      categoriesImage: json['categories_image'] as String,
    );
  }

  // Method to convert an Item instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'items_id': itemsId,
      'items_name': itemsName,
      'items_description': itemsDescription,
      'items_image': itemsImage,
      'items_count': itemsCount.toString(),
      'items_active': itemsActive ? 1 : 0,
      'items_price': itemsPrice.toString(),
      'items_discount': itemsDiscount,
      'items_date': itemsDate.toIso8601String(),
      'items_catigoray': itemsCategory,
      'categories_id': categoriesId,
      'categories_name': categoriesName,
      'categories_creationdate': categoriesCreationDate.toIso8601String(),
      'categories_image': categoriesImage,
    };
  }
}
