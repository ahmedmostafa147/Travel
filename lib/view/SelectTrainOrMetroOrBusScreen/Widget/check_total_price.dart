import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomizableCard extends StatelessWidget {
  final IconData icon;
  final String iconText;
  final String ticketsText;
  final String totalPrice;

  const CustomizableCard({
    super.key,
    required this.icon,
    required this.iconText,
    required this.ticketsText,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orangeAccent, width: 1),
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(icon),
                Text(iconText),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text('Tickets:'),
            SizedBox(
              height: 10.h,
            ),
            Text('${"Total Price:"} $totalPrice',
                style: TextStyle(
                  fontSize: 20.sp,
                )),
          ],
        ),
      ),
    );
  }
}
