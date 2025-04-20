class ProductModel {
  String? name;
  String? description;
  double? price;
  int? categoryId;
  String? image;
  int? quantity;

  ProductModel(
      {this.name,
      this.description,
      this.price,
      this.categoryId,
      this.image,
      this.quantity});

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    price = json['price'];
    categoryId = json['category_id'];
    image = json['image'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['category_id'] = this.categoryId;
    data['image'] = this.image;
    data['quantity'] = this.quantity;
    return data;
  }
}
