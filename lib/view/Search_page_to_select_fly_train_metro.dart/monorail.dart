import 'package:dughri/core/constant/images_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Monorail extends StatefulWidget {
  const Monorail({super.key});

  @override
  State<Monorail> createState() => _MonorailState();
}

class _MonorailState extends State<Monorail> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        FilterChip(
                          label: const Text('Price'),
                          onSelected: (bool value) {
                            // Handle the selection logic here
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        FilterChip(
                          label: const Text('Departure Time'),
                          onSelected: (bool value) {
                            // Handle the selection logic here
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        FilterChip(
                          label: const Text('Stops'),
                          onSelected: (bool value) {
                            // Handle the selection logic here
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        FilterChip(
                          label: const Text('Stops'),
                          onSelected: (bool value) {
                            // Handle the selection logic here
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        FilterChip(
                          label: const Text('Stops'),
                          onSelected: (bool value) {
                            // Handle the selection logic here
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: const AssetImage(Assets.imagesCompanylogo),
                            width: 50.w,
                            height: 50.h,
                          ),
                          const Text('9007'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '10:00 AM',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(2, 7, 102, 1)),
                              ),
                              const Text(
                                "Paris",
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '2h24m',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(128, 128, 132, 1)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '2:00 PM',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(2, 7, 102, 1)),
                              ),
                              const Text("landon"),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('\$100',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(2, 7, 102, 1))),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(FontAwesomeIcons.user),
                              SizedBox(
                                width: 10,
                              ),
                              Text('1-One-Way'),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                color: Color(0xffCCE1F7),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Transfers',
                                      style: TextStyle(
                                          fontSize: 15,
                                        
                                          color: Color(0xffF7F92B4))),
                                ),
                              ),
                              Card(
                                color: Color(0xffCCE1F7),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Limited availability',
                                      style: TextStyle(
                                          fontSize: 15,
                                        
                                          color: Color(0xffF7F92B4))),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
               const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: const AssetImage(Assets.imagesCompanylogo),
                            width: 50.w,
                            height: 50.h,
                          ),
                          const Text('9007'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '10:00 AM',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(2, 7, 102, 1)),
                              ),
                              const Text(
                                "Paris",
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '2h24m',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(128, 128, 132, 1)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '2:00 PM',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(2, 7, 102, 1)),
                              ),
                              const Text("landon"),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('\$100',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(2, 7, 102, 1))),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(FontAwesomeIcons.user),
                              SizedBox(
                                width: 10,
                              ),
                              Text('1-One-Way'),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                color: Color(0xffCCE1F7),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Transfers',
                                      style: TextStyle(
                                          fontSize: 15,
                                        
                                          color: Color(0xffF7F92B4))),
                                ),
                              ),
                              Card(
                                color: Color(0xffCCE1F7),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Limited availability',
                                      style: TextStyle(
                                          fontSize: 15,
                                        
                                          color: Color(0xffF7F92B4))),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
               const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: const AssetImage(Assets.imagesCompanylogo),
                            width: 50.w,
                            height: 50.h,
                          ),
                          const Text('9007'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '10:00 AM',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(2, 7, 102, 1)),
                              ),
                              const Text(
                                "Paris",
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '2h24m',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(128, 128, 132, 1)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '2:00 PM',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(2, 7, 102, 1)),
                              ),
                              const Text("landon"),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('\$100',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(2, 7, 102, 1))),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(FontAwesomeIcons.user),
                              SizedBox(
                                width: 10,
                              ),
                              Text('1-One-Way'),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                color: Color(0xffCCE1F7),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Transfers',
                                      style: TextStyle(
                                          fontSize: 15,
                                        
                                          color: Color(0xffF7F92B4))),
                                ),
                              ),
                              Card(
                                color: Color(0xffCCE1F7),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Limited availability',
                                      style: TextStyle(
                                          fontSize: 15,
                                        
                                          color: Color(0xffF7F92B4))),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
               const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: const AssetImage(Assets.imagesCompanylogo),
                            width: 50.w,
                            height: 50.h,
                          ),
                          const Text('9007'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '10:00 AM',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(2, 7, 102, 1)),
                              ),
                              const Text(
                                "Paris",
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '2h24m',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(128, 128, 132, 1)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '2:00 PM',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(2, 7, 102, 1)),
                              ),
                              const Text("landon"),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('\$100',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(2, 7, 102, 1))),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(FontAwesomeIcons.user),
                              SizedBox(
                                width: 10,
                              ),
                              Text('1-One-Way'),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                color: Color(0xffCCE1F7),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Transfers',
                                      style: TextStyle(
                                          fontSize: 15,
                                        
                                          color: Color(0xffF7F92B4))),
                                ),
                              ),
                              Card(
                                color: Color(0xffCCE1F7),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Limited availability',
                                      style: TextStyle(
                                          fontSize: 15,
                                        
                                          color: Color(0xffF7F92B4))),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
               const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: const AssetImage(Assets.imagesCompanylogo),
                            width: 50.w,
                            height: 50.h,
                          ),
                          const Text('9007'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '10:00 AM',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(2, 7, 102, 1)),
                              ),
                              const Text(
                                "Paris",
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '2h24m',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(128, 128, 132, 1)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '2:00 PM',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(2, 7, 102, 1)),
                              ),
                              const Text("landon"),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('\$100',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(2, 7, 102, 1))),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(FontAwesomeIcons.user),
                              SizedBox(
                                width: 10,
                              ),
                              Text('1-One-Way'),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                color: Color(0xffCCE1F7),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Transfers',
                                      style: TextStyle(
                                          fontSize: 15,
                                        
                                          color: Color(0xffF7F92B4))),
                                ),
                              ),
                              Card(
                                color: Color(0xffCCE1F7),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Limited availability',
                                      style: TextStyle(
                                          fontSize: 15,
                                        
                                          color: Color(0xffF7F92B4))),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
               const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: const AssetImage(Assets.imagesCompanylogo),
                            width: 50.w,
                            height: 50.h,
                          ),
                          const Text('9007'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '10:00 AM',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(2, 7, 102, 1)),
                              ),
                              const Text(
                                "Paris",
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '2h24m',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(128, 128, 132, 1)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '2:00 PM',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(2, 7, 102, 1)),
                              ),
                              const Text("landon"),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('\$100',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(2, 7, 102, 1))),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(FontAwesomeIcons.user),
                              SizedBox(
                                width: 10,
                              ),
                              Text('1-One-Way'),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                color: Color(0xffCCE1F7),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Transfers',
                                      style: TextStyle(
                                          fontSize: 15,
                                        
                                          color: Color(0xffF7F92B4))),
                                ),
                              ),
                              Card(
                                color: Color(0xffCCE1F7),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Limited availability',
                                      style: TextStyle(
                                          fontSize: 15,
                                        
                                          color: Color(0xffF7F92B4))),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
               const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: const AssetImage(Assets.imagesCompanylogo),
                            width: 50.w,
                            height: 50.h,
                          ),
                          const Text('9007'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '10:00 AM',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(2, 7, 102, 1)),
                              ),
                              const Text(
                                "Paris",
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            '2h24m',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(128, 128, 132, 1)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '2:00 PM',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromRGBO(2, 7, 102, 1)),
                              ),
                              const Text("landon"),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text('\$100',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(2, 7, 102, 1))),
                          const Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(FontAwesomeIcons.user),
                              SizedBox(
                                width: 10,
                              ),
                              Text('1-One-Way'),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                color: Color(0xffCCE1F7),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Transfers',
                                      style: TextStyle(
                                          fontSize: 15,
                                        
                                          color: Color(0xffF7F92B4))),
                                ),
                              ),
                              Card(
                                color: Color(0xffCCE1F7),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Limited availability',
                                      style: TextStyle(
                                          fontSize: 15,
                                        
                                          color: Color(0xffF7F92B4))),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
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