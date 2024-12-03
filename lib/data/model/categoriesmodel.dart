class CategoriesModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesCreationdate;
  String? categoriesImage;

  CategoriesModel(
      {this.categoriesId,
        this.categoriesName,
        this.categoriesCreationdate,
        this.categoriesImage});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesCreationdate = json['categories_creationdate'];
    categoriesImage = json['categories_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_creationdate'] = this.categoriesCreationdate;
    data['categories_image'] = this.categoriesImage;
    return data;
  }
}