import 'package:ecommerces_skl/components/menu_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                              contentPadding: EdgeInsets.symmetric(vertical: 3),
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
                                padding: EdgeInsets.symmetric(horizontal: 5.0),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        color: Color.fromARGB(255, 90, 90, 90),
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
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: ColoredBox(
                            color: const Color.fromARGB(255, 200, 200, 200),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        color: Color.fromARGB(255, 12, 176, 61),
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
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: ColoredBox(
                            color: const Color.fromARGB(255, 200, 200, 200),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        color: Color.fromARGB(255, 90, 90, 90),
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
          SizedBox(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/banner.png',
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/banner.png',
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/banner.png',
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/banner.png',
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
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
                  MenuButton(image: 'assets/images/menu_2.png', name: 'Mumpung', onTap: (){}),
                  MenuButton(image: 'assets/images/menu_2.png', name: 'Mumpung \nMurah', onTap: (){}),
                  MenuButton(image: 'assets/images/menu_2.png', name: 'Mumpung \nMurah', onTap: (){}),
                  MenuButton(image: 'assets/images/menu_2.png', name: 'Mumpung \nMurah', onTap: (){}),
                  MenuButton(image: 'assets/images/menu_2.png', name: 'Mumpung \nMurah', onTap: (){}),
                  MenuButton(image: 'assets/images/menu_2.png', name: 'Mumpung \nMurah', onTap: (){}),
                  MenuButton(image: 'assets/images/menu_2.png', name: 'Mumpung \nMurah', onTap: (){}),
                  MenuButton(image: 'assets/images/menu_2.png', name: 'Mumpung \nMurah', onTap: (){}),
                  MenuButton(image: 'assets/images/menu_2.png', name: 'Mumpung \nMurah', onTap: (){}),
                ],
              ),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
