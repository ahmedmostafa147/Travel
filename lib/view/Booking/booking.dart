import 'package:dughri/core/constant/Images_Path.dart';
import 'package:dughri/view/Booking/history.dart';
import 'package:dughri/view/Booking/upcoming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingHistoryOrArchived extends StatefulWidget {
  const BookingHistoryOrArchived({super.key});

  @override
  State<BookingHistoryOrArchived> createState() =>
      _BookingHistoryOrArchivedState();
}

class _BookingHistoryOrArchivedState extends State<BookingHistoryOrArchived>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
            image: AssetImage(Assets.imagesWait),
            fit: BoxFit.cover,
          ),
          const Positioned(
            top: 280,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  ' your Booking',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          DefaultTabController(
            length: 2, // The number of tabs
            child: Column(
              children: [
                SizedBox(
                  height: 268.h,
                ),
                const Card(
                  child: TabBar(
                    tabs: [
                      Tab(text: 'Upcoming'),
                      Tab(text: 'Archived'),
                    ],
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      UpComing(),
                      Archived(),
                    ],
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
