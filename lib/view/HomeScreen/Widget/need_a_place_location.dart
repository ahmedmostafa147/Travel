import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NeedPlaceTextWithLocation extends StatefulWidget {
  const NeedPlaceTextWithLocation({super.key, required this.destination});
  final String destination;

  @override
  State<NeedPlaceTextWithLocation> createState() =>
      _NeedPlaceTextWithLocationState();
}

class _NeedPlaceTextWithLocationState extends State<NeedPlaceTextWithLocation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${"Need a Place to stay in"} ${widget.destination}?",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
          Divider(
            color: Colors.grey,
            height: 5.sp,
          ),
        ],
      ),
    );
  }
}
