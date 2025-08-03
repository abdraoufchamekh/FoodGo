import 'package:flutter/material.dart';

class Spicysliderpage extends StatefulWidget {
  const Spicysliderpage({super.key});

  @override
  State<Spicysliderpage> createState() => _SpicysliderpageState();
}

class _SpicysliderpageState extends State<Spicysliderpage> {
  double _spiceLevel = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Spicy',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          // const SizedBox(height: 16),

          // Custom Slider with Gradient
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: const LinearGradient(
                    colors: [Colors.green, Colors.red],
                  ),
                ),
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 6,
                  inactiveTrackColor: Colors.transparent,
                  activeTrackColor: Colors.transparent,
                  thumbColor: Colors.white,
                  overlayColor: Colors.orange.withOpacity(0.2),
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 12,
                  ),
                ),
                child: Slider(
                  min: 0,
                  max: 10,
                  value: _spiceLevel,
                  onChanged: (value) {
                    setState(() {
                      _spiceLevel = value;
                    });
                  },
                ),
              ),
            ],
          ),
          // const SizedBox(height: 8),

          // Mild / Hot labels
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Mild',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Hot',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
