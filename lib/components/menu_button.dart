import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String image;
  final String name;
  final Function() onTap;

  const MenuButton({
    super.key,
    required this.image,
    required this.name,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 101.0,
        child: Column(
          children: [
            Image.asset(image, height: 60, width: 60),
            SizedBox(height: 5.0),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.3),
            ),
          ],
        ),
      ),
    );
  }
}
