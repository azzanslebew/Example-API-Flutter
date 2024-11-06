class PostModel {
  final int id;
  final String title;
  final double price;
  final String category;
  final String image;

  PostModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
  });

  // Factory method to create an instance of PostModel from JSON
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json["id"],
      title: json["title"],
      price: json["price"].toDouble(),
      category: json["category"],
      image: json["image"],
    );
  }
}
