import 'package:dughri/view/HomeScreen/Widget/custom_container_text_field.dart';
import 'package:dughri/view/HomeScreen/home_screen.dart';
import 'package:dughri/widget/AppBar/custom_app_bar.dart';
import 'package:dughri/widget/CustomMaterialButtom/custom_material.dart';
import 'package:dughri/widget/NavBar/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ShowDatePicker extends StatefulWidget {
  const ShowDatePicker({Key? key}) : super(key: key);

  @override
  _ShowDatePickerState createState() => _ShowDatePickerState();
}

class _ShowDatePickerState extends State<ShowDatePicker> {
  @override
  void initState() {
    
    super.initState();
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      if (args.value is PickerDateRange) {
        startDate = args.value.startDate;
        endDate = args.value.endDate;
      }
    });
  }

  Future<void> _saveDateRange() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('startDate', DateFormat("dd/MM/yyyy").format(startDate!));
    await prefs.setString('endDate',  DateFormat("dd/MM/yyyy").format(endDate!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Choose Date",
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomContainerTextField(
                  width: 164.w,
                  hintText: startDate == null
                      ? "From"
                      : DateFormat('dd/MM/yyyy').format(startDate!),
                  iconData: Icons.calendar_today_outlined,
                ),
                CustomContainerTextField(
                  width: 164.w,
                  hintText: endDate == null
                      ? "To"
                      : DateFormat('dd/MM/yyyy').format(endDate!),
                  iconData: Icons.calendar_today_outlined,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Card(
              elevation: 5,
              child: SfDateRangePicker(
                enablePastDates: false,
                headerHeight: 60.h,
                onSelectionChanged: _onSelectionChanged,
                selectionMode: DateRangePickerSelectionMode.range,
                showActionButtons: true,
                onCancel: () {
                  Navigator.pop(context);
                },
                onSubmit: (Object? value) {
                  final dynamic range = value;
                  startDate = range.startDate;
                  endDate = range.endDate;
                  setState(() {
                    startDate = range.startDate;
                    endDate = range.endDate;
                    Get.snackbar(
                      "Date Range",
                      "Start Date: ${DateFormat('dd/MM/yyyy').format(startDate!)}\nEnd Date: ${endDate != null ? DateFormat('dd/MM/yyyy').format(endDate!) : 'Not selected'}",
                      snackPosition: SnackPosition.TOP,
                      duration: const Duration(seconds: 3),
                    );
                  });
                },
              ),
            ),
            SizedBox(height: 20.h),
            CustomMaterialButton(
              buttonText: "Confirm",
              onPressed: () {
                _saveDateRange();
                _saveDateRange().then((_) {
                  Get.to(() => const NavBar());
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
