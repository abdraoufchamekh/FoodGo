import 'package:flutter/material.dart';

class Ordernow extends StatelessWidget {
  const Ordernow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xff3C2F2F),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Text(
          "ORDER NOW".toUpperCase(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
