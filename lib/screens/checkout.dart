import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodgo/button.dart/success.dart';
import 'package:foodgo/screens/adress_details.dart';
import 'package:foodgo/screens/credit_card_screen.dart';
import 'package:foodgo/widget/add_adress.dart';
import 'package:gap/gap.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key, required this.qty, required this.totalprice});
  final int qty;
  final double totalprice;

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String? _address;
  Map<String, dynamic>? _cardDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Order Summary Section
            const SizedBox(height: 15),
            const Padding(
              padding: EdgeInsets.only(right: 220),
              child: Text(
                "Order summary",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.only(left: 19),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order",
                        style: TextStyle(
                          color: Color(0xff7D7D7D),
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Gap(10),
                      Text(
                        "Taxes",
                        style: TextStyle(
                          color: Color(0xff7D7D7D),
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Gap(10),
                      Text(
                        "Delivery fees",
                        style: TextStyle(
                          color: Color(0xff7D7D7D),
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const Gap(195),
                  Column(
                    children: [
                      Text(
                        "\$${widget.totalprice}",
                        style: const TextStyle(
                          color: Color(0xff7D7D7D),
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Gap(10),
                      const Text(
                        "\$0.3",
                        style: TextStyle(
                          color: Color(0xff7D7D7D),
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const Gap(10),
                      const Text(
                        "\$1.5",
                        style: TextStyle(
                          color: Color(0xff7D7D7D),
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(15),
            SvgPicture.asset("assets/line.svg"),
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total:",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff3C2F2F),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "\$${widget.totalprice + 0.3 + 1.5}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color(0xff3C2F2F),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(15),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Estimated delivery time:",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff3C2F2F),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "15 - 30mins",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff3C2F2F),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
            SvgPicture.asset("assets/line.svg"),
            const Gap(20),

            // Shipping Address Section
            const Padding(
              padding: EdgeInsets.only(right: 200.0),
              child: Text(
                "Shipping Address",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const Gap(10),
            _address == null || _address!.isEmpty
                ? AddAdress(
                    entering: 'Add Shipping Address',
                    page: AdressDetails(
                      onSave: (address) {
                        setState(() {
                          _address = address;
                        });
                      },
                    ),
                  )
                : GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AdressDetails(
                            onSave: (address) {
                              setState(() {
                                _address = address;
                              });
                            },
                          ),
                        ),
                      );
                      if (result != null) {
                        setState(() {
                          _address = result;
                        });
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (final line in _address!.split('\n'))
                            if (line.trim().isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4,
                                ),
                                child: Text(
                                  line,
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.edit, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),

            // Payment Method Section
            const Gap(20),
            const Padding(
              padding: EdgeInsets.only(right: 200.0),
              child: Text(
                "Payment Method",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const Gap(10),
            _cardDetails == null
                ? GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreditCardScreen(),
                        ),
                      );
                      if (result != null) {
                        setState(() {
                          _cardDetails = result as Map<String, dynamic>;
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add Payment Method',
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(Icons.credit_card, color: Colors.grey),
                        ],
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreditCardScreen(),
                        ),
                      );
                      if (result != null) {
                        setState(() {
                          _cardDetails = result as Map<String, dynamic>;
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '•••• •••• •••• ${_cardDetails!['cardNumber'].substring(_cardDetails!['cardNumber'].length - 4)}',
                            style: const TextStyle(fontSize: 16),
                          ),
                          Text(
                            'Expires ${_cardDetails!['expiryDate']}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              Icons.edit,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            const Gap(10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (c) => const Success()),
                );
              },
              child: Container(
                width: 207,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xff3C2F2F),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "Pay Now",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
