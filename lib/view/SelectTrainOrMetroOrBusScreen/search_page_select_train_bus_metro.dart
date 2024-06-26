import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/bus.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/merto.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/monorail.dart';
import 'package:dughri/view/SelectTrainOrMetroOrBusScreen/train.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SelectWayTOGo extends StatefulWidget {
  const SelectWayTOGo({super.key});

  @override
  State<SelectWayTOGo> createState() => _SelectWayTOGoState();
}

class _SelectWayTOGoState extends State<SelectWayTOGo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff142968),
        title: Text("Select Way To Go",
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 20.sp,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 4, // The number of tabs
        child: Column(
          children: [
            TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 4.w,
              indicatorColor: const Color(0xffF46B6B),
              labelColor: const Color(0xff45507B),
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  height: 100.h,
                  icon: const Icon(Icons.train),
                  child: const Column(
                    children: [
                      Text('Train'),
                      Text(
                        '\$14',
                        style: TextStyle(
                            color: Color(0xff142968),
                            fontWeight: FontWeight.bold),
                      ),
                      Text('2h30m'),
                    ],
                  ),
                ),
                Tab(
                  height: 100.h,
                  icon: const Icon(FontAwesomeIcons.bus),
                  child: const Column(
                    children: [
                      Text('Bus'),
                      Text(
                        '\$14',
                        style: TextStyle(
                            color: Color(0xff142968),
                            fontWeight: FontWeight.bold),
                      ),
                      Text('2h30m'),
                    ],
                  ),
                ),
                Tab(
                  height: 100.h,
                  icon: const Icon(FontAwesomeIcons.trainSubway),
                  child: const Column(
                    children: [
                      Text('Metro'),
                      Text(
                        '\$14',
                        style: TextStyle(
                            color: Color(0xff142968),
                            fontWeight: FontWeight.bold),
                      ),
                      Text('2h30m'),
                    ],
                  ),
                ),
                Tab(
                  height: 100.h,
                  icon: const Icon(FontAwesomeIcons.trainTram),
                  child: const Column(
                    children: [
                      Text('Monorail'),
                      Text(
                        '\$14',
                        style: TextStyle(
                            color: Color(0xff142968),
                            fontWeight: FontWeight.bold),
                      ),
                      Text('2h30m'),
                    ],
                  ),
                ),
              ],
            ),
            const Expanded(
              child: TabBarView(
                children: [Train(), Bus(), Metro(), Monorail()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
