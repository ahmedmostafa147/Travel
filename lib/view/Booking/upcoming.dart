import 'package:dughri/core/constant/images_path.dart';
import 'package:flutter/material.dart';

class UpComing extends StatefulWidget {
  const UpComing({super.key});

  @override
  State<UpComing> createState() => _UpComingState();
}

class _UpComingState extends State<UpComing> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Image(
              image: AssetImage(Assets.imagesJourney),
              fit: BoxFit.cover,
            ),
            Text(
              "You have no upcoming journeys",
            )
          ],
        ),
      ),
    );
  }
}
