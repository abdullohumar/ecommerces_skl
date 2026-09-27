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

  /// Penanda unik barang di keranjang.
  /// Produk yang sama dengan varian berbeda dianggap barang yang berbeda.
  String get id => '${product.id}_${variant ?? '-'}';

  double get subtotal => product.price * quantity;

  /// Selisih harga coret dengan harga sekarang dikali jumlah
  double get savings =>
      ((product.originalPrice ?? product.price) - product.price) * quantity;

  /// Membuat salinan CartItem dengan beberapa nilai yang diganti.
  /// State Riverpod harus immutable, jadi kita tidak mengubah objek lama,
  /// tapi membuat objek baru.
  CartItem copyWith({int? quantity, bool? isSelected}) {
    return CartItem(
      product: product,
      storeName: storeName,
      variant: variant,
      quantity: quantity ?? this.quantity,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
