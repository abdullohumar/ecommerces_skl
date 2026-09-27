import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerces_skl/models/cart_model.dart';
import 'package:ecommerces_skl/models/dummy_cart.dart';

// ─────────────────────────────────────────────────────────────
// 1. STATE UTAMA: isi keranjang
// ─────────────────────────────────────────────────────────────

/// Notifier menyimpan state (`List<CartItem>`) sekaligus method untuk
/// mengubahnya. Widget tidak boleh mengubah list secara langsung,
/// semua perubahan lewat method di sini.
///
/// Aturan penting: jangan ubah `state` di tempat (misalnya `state.add(...)`),
/// tapi selalu berikan list BARU ke `state = ...`. Riverpod hanya tahu
/// ada perubahan jika objek state-nya diganti.
class CartNotifier extends Notifier<List<CartItem>> {
  /// Nilai awal state saat provider pertama kali dibaca.
  @override
  List<CartItem> build() => dummyCartItems;

  /// Centang / hapus centang satu barang.
  void toggleSelect(String id) {
    state = [
      for (final item in state)
        if (item.id == id) item.copyWith(isSelected: !item.isSelected) else item,
    ];
  }

  /// Centang / hapus centang semua barang dari satu toko.
  void toggleSelectStore(String storeName) {
    final storeItems = state.where((item) => item.storeName == storeName);
    final isAllSelected = storeItems.every((item) => item.isSelected);
    state = [
      for (final item in state)
        if (item.storeName == storeName)
          item.copyWith(isSelected: !isAllSelected)
        else
          item,
    ];
  }

  /// Centang / hapus centang semua barang di keranjang.
  void toggleSelectAll() {
    final isAllSelected = state.every((item) => item.isSelected);
    state = [
      for (final item in state) item.copyWith(isSelected: !isAllSelected),
    ];
  }

  /// Tambah jumlah barang.
  void increment(String id) {
    state = [
      for (final item in state)
        if (item.id == id) item.copyWith(quantity: item.quantity + 1) else item,
    ];
  }

  /// Kurangi jumlah barang, minimal 1.
  void decrement(String id) {
    state = [
      for (final item in state)
        if (item.id == id && item.quantity > 1)
          item.copyWith(quantity: item.quantity - 1)
        else
          item,
    ];
  }

  /// Hapus satu barang dari keranjang.
  void remove(String id) {
    state = state.where((item) => item.id != id).toList();
  }

  /// Hapus semua barang yang sedang dicentang.
  void removeSelected() {
    state = state.where((item) => !item.isSelected).toList();
  }
}

/// Provider yang "membungkus" CartNotifier agar bisa diakses dari widget.
/// - `ref.watch(cartProvider)`          -> membaca `List<CartItem>` + ikut rebuild
/// - `ref.read(cartProvider.notifier)`  -> mengambil CartNotifier untuk memanggil method
final cartProvider =
    NotifierProvider<CartNotifier, List<CartItem>>(CartNotifier.new);

// ─────────────────────────────────────────────────────────────
// 2. STATE TURUNAN (derived state)
// ─────────────────────────────────────────────────────────────
// Provider di bawah ini tidak menyimpan data sendiri. Nilainya dihitung
// dari cartProvider. Karena memakai `ref.watch(cartProvider)`, nilainya
// otomatis dihitung ulang setiap kali isi keranjang berubah.

/// Jumlah jenis barang di keranjang (dipakai untuk badge di Home).
final cartCountProvider = Provider<int>((ref) {
  return ref.watch(cartProvider).length;
});

/// Daftar barang yang sedang dicentang.
final selectedCartItemsProvider = Provider<List<CartItem>>((ref) {
  return ref.watch(cartProvider).where((item) => item.isSelected).toList();
});

/// Apakah semua barang sedang dicentang.
final isAllCartSelectedProvider = Provider<bool>((ref) {
  final cart = ref.watch(cartProvider);
  return cart.isNotEmpty && cart.every((item) => item.isSelected);
});

/// Total harga barang yang dicentang.
final cartTotalPriceProvider = Provider<double>((ref) {
  final selected = ref.watch(selectedCartItemsProvider);
  return selected.fold(0.0, (sum, item) => sum + item.subtotal);
});

/// Total hemat dari barang yang dicentang.
final cartTotalSavingsProvider = Provider<double>((ref) {
  final selected = ref.watch(selectedCartItemsProvider);
  return selected.fold(0.0, (sum, item) => sum + item.savings);
});

/// Total kuantitas barang yang dicentang (angka di tombol "Beli").
final cartSelectedQuantityProvider = Provider<int>((ref) {
  final selected = ref.watch(selectedCartItemsProvider);
  return selected.fold(0, (sum, item) => sum + item.quantity);
});
