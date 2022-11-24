class Product {

  int id;
  int count=0;
  int? databaseid;
  int category_id;
  String name;
  num price;
  String image_url;
  String description;

  Product(
      {
        this.count=0,
        this.databaseid,
        required this.image_url,
        required this.id,
        required this.name,
        required this.description,
        required this.price,
        required this.category_id});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      count: json['count']??0,
      image_url: json["image_url"] ?? "",
      id: json['id'] ?? 0,
      name: json['name'] ?? "No name",
      description: json["description"] ?? "No data",
      price: json['price'] ?? 0,
      category_id: json['category_id'] ?? 0,
    );
  }

  Map<String,dynamic> toJson() {
    return {
      "_id":this.databaseid,
      "count":this.count,
      "category_id" : this.category_id,
      "id": this.id,
      "price": this.price,
      "description": this.description,
      "name": this.name,
      "image_url": this.image_url,
    };
  }

  Product copyWith({
    int? id,
    int? count,
    int? databaseid,
    int? category_id,
    String? name,
    num? price,
    String? image_url,
    String? description,
  })=>
      Product(
        count: count??this.count,
        databaseid: databaseid??this.databaseid,
        id: id ?? this.id,
        image_url: image_url??this.image_url,
        description: description??this.description,
        price: price??this.price,
        category_id: category_id??this.category_id,
        name: name??this.name,

      );
}