class Product {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final double? originalPrice;
  final int discountPercent;
  final double rating;
  final int sold;
  final String location;
  final String category;
  final bool isFreeShipping;
  final bool isOfficial;

  const Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.originalPrice,
    this.discountPercent = 0,
    required this.rating,
    required this.sold,
    required this.location,
    required this.category,
    this.isFreeShipping = false,
    this.isOfficial = false,
  });
}
