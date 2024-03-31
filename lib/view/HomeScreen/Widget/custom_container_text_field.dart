// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerTextField extends StatefulWidget {
  final String hintText;
  final IconData iconData;
  final double? width;

  const CustomContainerTextField({
    Key? key,
    required this.hintText,
    required this.iconData,
    this.width,
  }) : super(key: key);

  @override
  State<CustomContainerTextField> createState() =>
      _CustomContainerTextFieldState();
}

class _CustomContainerTextFieldState extends State<CustomContainerTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Container(
        width: widget.width,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(241, 242, 246, 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: SizedBox(
            height: 40.h,
            width: double.maxFinite,
            child: Row(
              children: [
                Icon(widget.iconData,
                    size: 20.sp,
                    color: const Color(0xffA0A7C4)),
                const SizedBox(width: 10),
                Text(widget.hintText,
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w200,
                        color: const Color.fromARGB(244, 39, 50, 89))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
