import 'package:flutter/material.dart';
import 'package:foodgo/button.dart/ordernow.dart';
import 'package:foodgo/button.dart/price.dart';
import 'package:foodgo/screens/checkout.dart';
import 'package:foodgo/screens/productmodel.dart';
import 'package:foodgo/widget/SpicySliderPage.dart';
import 'package:foodgo/widget/quantity.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Image.asset(
            product.image,
            fit: BoxFit.cover,
            height: 280,
            width: double.infinity,
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Text(
              product.name + product.description,
              style: const TextStyle(fontSize: 25, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 30),
                    const SizedBox(width: 2),
                    Text(
                      product.rating,
                      style: const TextStyle(fontSize: 20, color: Color(0xff6A6A6A)),
                    ),
                    const SizedBox(width: 2),
                    const Text(
                      "-",
                      style: TextStyle(fontSize: 20, color: Color(0xff6A6A6A)),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      product.timed,
                      style: const TextStyle(fontSize: 20, color: Color(0xff6A6A6A)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  product.bigdesc,
                  style: const TextStyle(fontSize: 16, color: Color(0xff6A6A6A)),
                ),
              ],
            ),
          ),
          // SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(width: 170, child: Spicysliderpage()),
                  ),
                ),
                Quantity(),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Price(products: product),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    int qty = Quantity.selectedQuantity;
                    String pricestring = product.price.replaceAll('\$', '');
                    double unitprice = double.parse(pricestring);
                    double totalprice = qty * unitprice;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) =>
                            Checkout(qty: qty, totalprice: totalprice,),
                      ),
                    );
                  },
                  child: const Ordernow(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
