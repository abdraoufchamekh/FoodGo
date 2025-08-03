import 'package:flutter/material.dart';
import 'package:foodgo/screens/productmodel.dart';

class Price extends StatelessWidget {
  final ProductModel products;
  const Price({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xffEF2A39),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          products.price,
          style: const TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),
    );
  }
}
