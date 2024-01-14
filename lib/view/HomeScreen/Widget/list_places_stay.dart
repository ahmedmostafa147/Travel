import 'package:dughri/core/constant/Images_Path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListPlacesToStay extends StatefulWidget {
  const ListPlacesToStay({super.key});

  @override
  State<ListPlacesToStay> createState() => _ListPlacesToStayState();
}

class _ListPlacesToStayState extends State<ListPlacesToStay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        height: 150.h,
        child: ListView.builder(
            itemCount: 5,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(24),
                          ),
                          child: Image.asset(
                            Assets.imagesBackground,
                            height: 150.h,
                            width: 150.w,
                            fit: BoxFit.cover,
                          )),
                      Positioned(
                        bottom: 20,
                        left: 20,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, .5),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          child: const Text(
                            "Hotel",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
