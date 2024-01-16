import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomizableClassSelectionContainer extends StatelessWidget {
  final String title;
  final List<ClassOption> classOptions;

  const CustomizableClassSelectionContainer({
    super.key,
    required this.title,
    required this.classOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            color: const Color.fromRGBO(2, 7, 102, 1),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: classOptions.map((option) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomClassOptionCard(
                  option: option,
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "You also get",
              style: TextStyle(
                fontSize: 20.sp,
                color: (const Color.fromRGBO(2, 7, 102, 1)),
              ),
            ),
            Text(
              "Two Pieces of baggage and one piece of hand baggage allowed. Eurostar requires passengers to arrive at the station 120 minutes.",
              style: TextStyle(
                fontSize: 10.sp,
                color: (const Color.fromRGBO(105, 106, 117, 1)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomClassOptionCard extends StatelessWidget {
  final ClassOption option;

  const CustomClassOptionCard({
    super.key,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 250.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.5),
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(120, 222, 235, 249),
      ),
      child: Column(
        children: [
          Text(option.className),
          Image(
            height: 50.h,
            width: 50.w,
            image: AssetImage(option.classImage),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (var feature in option.classFeatures)
                  Row(
                    children: [
                      Icon(
                        feature.icon,
                        color: const Color(0xff475183),
                      ),
                      SizedBox(
                        width: 10.h,
                      ),
                      Text(
                        feature.text,
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                SizedBox(height: 5.h),
                SizedBox(width: 5.h),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  option.additionalCost,
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClassOption {
  final String className;
  final String classImage;
  final List<ClassFeature> classFeatures;
  final String additionalCost;

  const ClassOption({
    required this.className,
    required this.classImage,
    required this.classFeatures,
    required this.additionalCost,
  });
}

class ClassFeature {
  final IconData icon;
  final String text;

  const ClassFeature({
    required this.icon,
    required this.text,
  });
}
