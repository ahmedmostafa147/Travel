import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    super.key,
    required this.title,
    required this.price,
    required this.duration,
    required this.icon,
    required this.available,
  });

  final String title;
  final String price;
  final String duration;
  final IconData icon;
  final bool available;

  @override
  Widget build(BuildContext context) {
    return Tab(
      height: 100.h,
      icon: Icon(icon),
      child: Column(
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            price,
            style: const TextStyle(
              color: Color(0xff142968),
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          available
              ? Text(duration)
              : const Text(
                  "Not av",
                  style: TextStyle(color: Colors.red),
                ),
        ],
      ),
    );
  }
}
