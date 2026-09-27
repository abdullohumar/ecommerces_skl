import 'package:ecommerces_skl/models/cart_model.dart';
import 'package:ecommerces_skl/models/dummy_cart.dart';
import 'package:ecommerces_skl/utils/formatter.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Sementara masih statis, nanti diganti dengan state Riverpod
    final cartItems = dummyCartItems;

    // Nilai turunan dari isi keranjang
    final selectedItems = cartItems.where((item) => item.isSelected).toList();
    final isAllSelected =
        cartItems.isNotEmpty && selectedItems.length == cartItems.length;
    final totalPrice =
        selectedItems.fold(0.0, (sum, item) => sum + item.subtotal);
    final totalSavings =
        selectedItems.fold(0.0, (sum, item) => sum + item.savings);
    final selectedQuantity =
        selectedItems.fold(0, (sum, item) => sum + item.quantity);

    // Kelompokkan barang berdasarkan toko
    final Map<String, List<CartItem>> itemsByStore = {};
    for (final item in cartItems) {
      itemsByStore.putIfAbsent(item.storeName, () => []).add(item);
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: const Text(
          'Keranjang',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
        ],
      ),
      body: cartItems.isEmpty
          ? const _EmptyCart()
          : ListView(
              padding: const EdgeInsets.only(bottom: 16),
              children: [
                // ── Pilih Semua ──
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(4, 4, 8, 4),
                  child: Row(
                    children: [
                      _CartCheckbox(value: isAllSelected, onChanged: () {}),
                      Text(
                        'Pilih Semua (${cartItems.length})',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const Spacer(),
                      if (selectedItems.isNotEmpty)
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF03AC0E),
                          ),
                          child: const Text(
                            'Hapus',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                    ],
                  ),
                ),

                // ── Barang per Toko ──
                for (final entry in itemsByStore.entries)
                  _StoreSection(storeName: entry.key, items: entry.value),

                // ── Promo ──
                Container(
                  margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFD4EDDA)),
                  ),
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.local_offer,
                        color: Color(0xFF03AC0E)),
                    title: const Text(
                      'Makin hemat pakai promo',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                    trailing:
                        const Icon(Icons.chevron_right, color: Colors.grey),
                  ),
                ),
              ],
            ),
      bottomNavigationBar: cartItems.isEmpty
          ? null
          : _CartSummaryBar(
              totalPrice: totalPrice,
              totalSavings: totalSavings,
              selectedQuantity: selectedQuantity,
            ),
    );
  }
}

class _StoreSection extends StatelessWidget {
  final String storeName;
  final List<CartItem> items;

  const _StoreSection({required this.storeName, required this.items});

  @override
  Widget build(BuildContext context) {
    final isAllSelected = items.every((item) => item.isSelected);
    final isOfficial = items.first.product.isOfficial;

    return Container(
      margin: const EdgeInsets.only(top: 8),
      color: Colors.white,
      child: Column(
        children: [
          // Header toko
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 8, 16, 0),
            child: Row(
              children: [
                _CartCheckbox(value: isAllSelected, onChanged: () {}),
                Icon(
                  isOfficial ? Icons.verified : Icons.storefront,
                  size: 18,
                  color: isOfficial ? const Color(0xFF03AC0E) : Colors.black54,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    storeName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          for (int i = 0; i < items.length; i++) ...[
            if (i > 0) const Divider(height: 1, indent: 56, endIndent: 16),
            _CartItemTile(item: items[i]),
          ],
        ],
      ),
    );
  }
}

class _CartItemTile extends StatelessWidget {
  final CartItem item;

  const _CartItemTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final product = item.product;

    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 8, 16, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CartCheckbox(value: item.isSelected, onChanged: () {}),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              product.imageUrl,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stack) => Container(
                width: 72,
                height: 72,
                color: const Color(0xFFF5F5F5),
                child: const Icon(Icons.image_not_supported,
                    color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 13, height: 1.3),
                ),
                if (item.variant != null) ...[
                  const SizedBox(height: 4),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF3F3F3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      item.variant!,
                      style: const TextStyle(fontSize: 11, color: Colors.grey),
                    ),
                  ),
                ],
                const SizedBox(height: 6),
                // Harga
                Row(
                  children: [
                    Text(
                      formatRupiah(product.price),
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    if (product.originalPrice != null) ...[
                      const SizedBox(width: 6),
                      Text(
                        formatRupiah(product.originalPrice!),
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                // Aksi & jumlah
                Row(
                  children: [
                    _SmallIconButton(
                      icon: Icons.favorite_border,
                      onTap: () {},
                    ),
                    const SizedBox(width: 4),
                    _SmallIconButton(
                      icon: Icons.delete_outline,
                      onTap: () {},
                    ),
                    const Spacer(),
                    _QuantityStepper(
                      quantity: item.quantity,
                      onDecrement: () {},
                      onIncrement: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CartCheckbox extends StatelessWidget {
  final bool value;
  final VoidCallback onChanged;

  const _CartCheckbox({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (_) => onChanged(),
      activeColor: const Color(0xFF03AC0E),
      side: const BorderSide(color: Colors.grey, width: 1.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      visualDensity: VisualDensity.compact,
    );
  }
}

class _SmallIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SmallIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Icon(icon, size: 20, color: Colors.grey.shade600),
      ),
    );
  }
}

class _QuantityStepper extends StatelessWidget {
  final int quantity;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const _QuantityStepper({
    required this.quantity,
    required this.onDecrement,
    required this.onIncrement,
  });

  @override
  Widget build(BuildContext context) {
    final canDecrement = quantity > 1;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFDDDDDD)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: canDecrement ? onDecrement : null,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Icon(
                Icons.remove,
                size: 18,
                color: canDecrement
                    ? const Color(0xFF03AC0E)
                    : Colors.grey.shade400,
              ),
            ),
          ),
          SizedBox(
            width: 32,
            child: Text(
              '$quantity',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
            ),
          ),
          InkWell(
            onTap: onIncrement,
            child: const Padding(
              padding: EdgeInsets.all(4),
              child: Icon(Icons.add, size: 18, color: Color(0xFF03AC0E)),
            ),
          ),
        ],
      ),
    );
  }
}

class _CartSummaryBar extends StatelessWidget {
  final double totalPrice;
  final double totalSavings;
  final int selectedQuantity;

  const _CartSummaryBar({
    required this.totalPrice,
    required this.totalSavings,
    required this.selectedQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Harga',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                    Text(
                      selectedQuantity > 0 ? formatRupiah(totalPrice) : '-',
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    if (totalSavings > 0)
                      Text(
                        'Hemat ${formatRupiah(totalSavings)}',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF03AC0E),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
              ),
              FilledButton(
                onPressed: selectedQuantity > 0 ? () {} : null,
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFF03AC0E),
                  minimumSize: const Size(130, 46),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Beli ($selectedQuantity)',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.shopping_cart_outlined,
                size: 88, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            const Text(
              'Wah, keranjang belanjamu kosong',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'Yuk, isi dengan barang-barang impianmu!',
              style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(),
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF03AC0E),
                minimumSize: const Size(180, 44),
              ),
              child: const Text('Mulai Belanja'),
            ),
          ],
        ),
      ),
    );
  }
}
