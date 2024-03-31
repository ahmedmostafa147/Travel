import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSettingTab extends StatelessWidget {
  const CustomSettingTab(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap,
      this.trailing});
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final List<Widget>? trailing;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(children: [
        Icon(
          icon,
          size: 20.r,
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 15.sp,
            color: const Color(0xff142968),
          ),
        ),
        if (trailing != null) ...trailing!
      ]),
    );
  }
}
