import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  String _formatPrice(double price) {
    if (price >= 1000000) {
      return 'Rp${(price / 1000000).toStringAsFixed(price % 1000000 == 0 ? 0 : 1)}jt';
    }
    final formatted = price
        .toInt()
        .toString()
        .replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+$)'), (m) => '${m[1]}.');
    return 'Rp$formatted';
  }

  String _formatSold(int sold) {
    if (sold >= 1000) {
      return '${(sold / 1000).toStringAsFixed(sold % 1000 == 0 ? 0 : 1)}rb';
    }
    return sold.toString();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Produk
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return Container(
                        color: const Color(0xFFF5F5F5),
                        child: const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Color(0xFF03AC0E),
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stack) => Container(
                      color: const Color(0xFFF5F5F5),
                      child: const Icon(Icons.image_not_supported,
                          color: Colors.grey, size: 40),
                    ),
                  ),
                ),
                // Badge Diskon
                if (product.discountPercent > 0)
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF4D4D),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${product.discountPercent}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                // Badge Free Ongkir
                if (product.isFreeShipping)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 3),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF03AC0E), Color(0xFF00C853)],
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.local_shipping,
                              color: Colors.white, size: 11),
                          SizedBox(width: 3),
                          Text(
                            'Gratis Ongkir',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            // Info Produk
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12, height: 1.3),
                    ),
                    const SizedBox(height: 4),
                    // Harga
                    Text(
                      _formatPrice(product.price),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Color(0xFF212121),
                      ),
                    ),
                    // Harga coret
                    if (product.originalPrice != null)
                      Text(
                        _formatPrice(product.originalPrice!),
                        style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontSize: 11,
                        ),
                      ),
                    const SizedBox(height: 4),
                    // Rating & Terjual
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Color(0xFFFFA500), size: 12),
                        const SizedBox(width: 2),
                        Text(
                          product.rating.toString(),
                          style: const TextStyle(
                              fontSize: 11, color: Colors.black87),
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '| ${_formatSold(product.sold)} terjual',
                            style: const TextStyle(
                                fontSize: 11, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    // Lokasi & Official badge
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: Colors.grey, size: 11),
                        const SizedBox(width: 2),
                        Expanded(
                          child: Text(
                            product.location,
                            style: const TextStyle(
                                fontSize: 11, color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (product.isOfficial)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 1),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color(0xFF03AC0E), width: 0.8),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: const Text(
                              'Official',
                              style: TextStyle(
                                fontSize: 9,
                                color: Color(0xFF03AC0E),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
