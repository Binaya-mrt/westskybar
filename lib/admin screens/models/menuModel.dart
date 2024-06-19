class MenuItem {
  final String id;
  final String name;
  final String category;
  final int price;
  final String detail;
  final String image;
  final bool isAvailable;

  MenuItem({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.detail,
    required this.image,
    required this.isAvailable,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      id: json['_id'],
      name: json['name'],
      category: json['category'],
      price: json['price'],
      detail: json['detail'],
      image: json['image'],
      isAvailable: json['isAvailable'],
    );
  }
}
