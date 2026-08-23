import 'package:ecommerces_skl/components/menu_button.dart';
import 'package:ecommerces_skl/components/product_card.dart';
import 'package:ecommerces_skl/models/dummy_products.dart';
import 'package:ecommerces_skl/models/product_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedCategory = 'Semua';

  List<Product> get _filteredProducts {
    if (_selectedCategory == 'Semua') return dummyProducts;
    return dummyProducts
        .where((p) => p.category == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ── Navbar ──
            Stack(
              children: [
                Image.asset(
                  'assets/images/navbar_bg.png',
                  width: double.maxFinite,
                  height: 160.0,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(Icons.search, size: 25.0),
                                prefixIconColor: Colors.black,
                                hint: Text(
                                  'Cari di tokped...',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 17.0,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 3),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.mail_outline, size: 25.0),
                            visualDensity: VisualDensity.compact,
                          ),
                          Stack(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications_outlined,
                                  size: 25.0,
                                ),
                                visualDensity: VisualDensity.compact,
                              ),
                              Positioned(
                                right: 8.0,
                                top: 5.0,
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.0),
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.shopping_cart_outlined, size: 25.0),
                            visualDensity: VisualDensity.compact,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.menu, size: 25.0),
                            visualDensity: VisualDensity.compact,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.green,
                            size: 20.0,
                          ),
                          Text(' Dikirim ke '),
                          Text(
                            'Rumah Denis Alwan (Brebes)',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.keyboard_arrow_down_outlined),
                            visualDensity: VisualDensity.compact,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/gopay_logo.png',
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Rp99.999.99',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13.0,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        '0 Coins',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 90, 90, 90),
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: ColoredBox(
                              color:
                                  const Color.fromARGB(255, 200, 200, 200),
                              child: const SizedBox(width: 1.0, height: 30.0),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/promo_logo.png',
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Diskon 9,999%',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.0,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        'Langganan, Yuk!',
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 12, 176, 61),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 11.0,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: ColoredBox(
                              color:
                                  const Color.fromARGB(255, 200, 200, 200),
                              child: const SizedBox(width: 1.0, height: 30.0),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/tier_logo.png',
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Silver',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13.0,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        '16 Kupon Baru',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 90, 90, 90),
                                          fontSize: 11.0,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // ── Banner ──
            SizedBox(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.asset('assets/images/banner.png',
                        height: 150, fit: BoxFit.cover),
                    Image.asset('assets/images/banner.png',
                        height: 150, fit: BoxFit.cover),
                    Image.asset('assets/images/banner.png',
                        height: 150, fit: BoxFit.cover),
                    Image.asset('assets/images/banner.png',
                        height: 150, fit: BoxFit.cover),
                  ],
                ),
              ),
            ),

            // ── Menu Buttons ──
            SizedBox(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 8.0),
                child: Row(
                  spacing: 10.0,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/menu_1.png',
                            height: 60,
                            width: 60,
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "Promo \nRamadhan",
                            textAlign: TextAlign.center,
                            style: TextStyle(height: 1.3),
                          ),
                        ],
                      ),
                    ),
                    MenuButton(
                        image: 'assets/images/menu_2.png',
                        name: 'Mumpung',
                        onTap: () {}),
                    MenuButton(
                        image: 'assets/images/menu_2.png',
                        name: 'Mumpung \nMurah',
                        onTap: () {}),
                    MenuButton(
                        image: 'assets/images/menu_2.png',
                        name: 'Mumpung \nMurah',
                        onTap: () {}),
                    MenuButton(
                        image: 'assets/images/menu_2.png',
                        name: 'Mumpung \nMurah',
                        onTap: () {}),
                    MenuButton(
                        image: 'assets/images/menu_2.png',
                        name: 'Mumpung \nMurah',
                        onTap: () {}),
                    MenuButton(
                        image: 'assets/images/menu_2.png',
                        name: 'Mumpung \nMurah',
                        onTap: () {}),
                    MenuButton(
                        image: 'assets/images/menu_2.png',
                        name: 'Mumpung \nMurah',
                        onTap: () {}),
                    MenuButton(
                        image: 'assets/images/menu_2.png',
                        name: 'Mumpung \nMurah',
                        onTap: () {}),
                  ],
                ),
              ),
            ),

            const Divider(height: 1),
            const SizedBox(height: 8),

            // ── Judul Section Produk ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Container(
                    width: 4,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color(0xFF03AC0E),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Rekomendasi Untukmu',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ── Filter Kategori ──
            SizedBox(
              height: 38,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: productCategories.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final category = productCategories[index];
                  final isSelected = _selectedCategory == category;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 7),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF03AC0E)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF03AC0E)
                              : const Color(0xFFDDDDDD),
                          width: 1.2,
                        ),
                        boxShadow: isSelected
                            ? [
                                BoxShadow(
                                  color: const Color(0xFF03AC0E)
                                      .withValues(alpha: 0.25),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                )
                              ]
                            : [],
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color:
                              isSelected ? Colors.white : Colors.black87,
                          fontSize: 13,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 12),

            // ── Grid Produk ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.57,
                ),
                itemCount: _filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = _filteredProducts[index];
                  return ProductCard(
                    product: product,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Membuka: ${product.name}'),
                          duration: const Duration(seconds: 1),
                          backgroundColor: const Color(0xFF03AC0E),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
