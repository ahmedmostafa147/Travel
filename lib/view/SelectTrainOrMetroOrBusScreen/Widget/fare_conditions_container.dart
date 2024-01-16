import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomizableFareConditionsContainer extends StatelessWidget {
  final String fareType;
  final String refundability;
  final String exchangeability;
  final String fareTerms;

  const CustomizableFareConditionsContainer({
    super.key,
    required this.fareType,
    required this.refundability,
    required this.exchangeability,
    required this.fareTerms,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Fare Conditions",
            style: TextStyle(
              fontSize: 20.sp,
              color: const Color.fromRGBO(2, 7, 102, 1),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            width: 150.w,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.redAccent, width: 2),
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            child: Column(
              children: [
                Text(fareType),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.info,
                            color: Color(0xff475183),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            refundability,
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.shuffle,
                            color: Color(0xff475183),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            exchangeability,
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "Fare terms",
            style: TextStyle(
              fontSize: 20.sp,
              color: const Color.fromRGBO(2, 7, 102, 1),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(fareTerms, style: TextStyle(fontSize: 10.sp,color: Colors.red),),
        ],
      ),
    );
  }
}
