import 'product_model.dart';

class CartItem {
  final Product product;
  final String storeName;
  final String? variant;
  final int quantity;
  final bool isSelected;

  const CartItem({
    required this.product,
    required this.storeName,
    this.variant,
    this.quantity = 1,
    this.isSelected = true,
  });

  double get subtotal => product.price * quantity;

  /// Selisih harga coret dengan harga sekarang dikali jumlah
  double get savings =>
      ((product.originalPrice ?? product.price) - product.price) * quantity;
}
