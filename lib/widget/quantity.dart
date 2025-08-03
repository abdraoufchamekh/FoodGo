import 'package:flutter/material.dart';

class Quantity extends StatefulWidget {
  const Quantity({super.key});
  static int selectedQuantity = 1;
  
  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  int number = Quantity.selectedQuantity;
  void updateQuantity(int newNumber) {
    setState(() {
      number = newNumber;
      Quantity.selectedQuantity = number;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Portion",
          style: TextStyle(
            color: Color(0xff3C2F2F),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (number > 0) {
                    setState(() {
                      updateQuantity(number - 1);
                    });
                  }
                });
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffEF2A39),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.remove, color: Colors.white, size: 20),
              ),
            ),
            const SizedBox(width: 5),
            Text(
              '$number',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                setState(() {
                  updateQuantity(number + 1);
                });
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xffEF2A39),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
