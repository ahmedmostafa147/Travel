import 'package:dughri/core/constant/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLogoAuth extends StatelessWidget {
  const CustomLogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
                child: Container(
                    alignment: Alignment.center,
                    width: 70.w,
                    height: 70.h,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Image.asset(
                       Assets.imagesLogo,
                      height: 80,
                      // fit: BoxFit.fill,
                    )),
              ); 
  }
}