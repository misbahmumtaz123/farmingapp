class ProductModel {
  final String id;
  final String title;
  final String image;
  final String price;
  final String unit;
  final bool isFeatured;

  ProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.unit,
    this.isFeatured = false,
  });
}
