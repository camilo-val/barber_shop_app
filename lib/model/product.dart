class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final String image;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json['id'] as int,
    title: json['title'] as String,
    description: json['description'] as String,
    price: (json['price'] as num).toDouble(),
    image: json['image'] as String,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'price': price,
    'image': image,
  };
}
