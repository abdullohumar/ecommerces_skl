import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerces_skl/models/dummy_products.dart';
import 'package:ecommerces_skl/models/product_model.dart';

/// Provider untuk menyimpan kategori produk yang dipilih.
/// Menggantikan [_selectedCategory] + setState di HomePage.
final selectedCategoryProvider = StateProvider<String>((ref) => 'Semua');

/// Provider yang mengembalikan daftar produk sudah difilter berdasarkan kategori.
/// Menggantikan getter [_filteredProducts] di HomePage.
final filteredProductsProvider = Provider<List<Product>>((ref) {
  final category = ref.watch(selectedCategoryProvider);
  if (category == 'Semua') return dummyProducts;
  return dummyProducts.where((p) => p.category == category).toList();
});
