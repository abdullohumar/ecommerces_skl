import 'cart_model.dart';
import 'dummy_products.dart';

final List<CartItem> dummyCartItems = [
  CartItem(
    product: dummyProducts[0],
    storeName: 'JBL Official Store',
    variant: 'Hitam',
  ),
  CartItem(
    product: dummyProducts[4],
    storeName: 'Distro Bandung Keren',
    variant: 'Putih, L',
    quantity: 2,
  ),
  CartItem(
    product: dummyProducts[5],
    storeName: 'Distro Bandung Keren',
    variant: 'Navy, 32',
    isSelected: false,
  ),
  CartItem(
    product: dummyProducts[11],
    storeName: 'Kopi Gayo Nusantara',
    variant: 'Biji Utuh',
    quantity: 2,
  ),
  CartItem(
    product: dummyProducts[15],
    storeName: 'Beauty Glow Store',
    isSelected: false,
  ),
];
