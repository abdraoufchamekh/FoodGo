import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Container(
          width: 350,
          height: 410,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.red, size: 100),
              const Gap(20),
              const Text(
                "Success !",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              const Gap(20),
              const Text(
                '''     Your payment was successful
     A receipt for this purchase has\n     been sent to your email''',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              const Gap(40),
              GestureDetector(
                onTap: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: Container(
                  width: 220,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xffEF2A39),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Text(
                      "Go Back",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
