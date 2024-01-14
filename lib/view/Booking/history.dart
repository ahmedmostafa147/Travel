import 'package:dughri/core/constant/images_path.dart';
import 'package:flutter/material.dart';

class Archived extends StatefulWidget {
  const Archived({super.key});

  @override
  State<Archived> createState() => _ArchivedState();
}

class _ArchivedState extends State<Archived> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage(Assets.imagesTicket),
              fit: BoxFit.cover,
            ),

            Text(
              "your tickets will archived here",)
          ],
        ),
      ),
    );
  }
}
