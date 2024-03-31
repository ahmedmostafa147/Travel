import 'package:flutter/material.dart';

class CustomFilterChipList extends StatelessWidget {
  final List<String> filterOptions;
  final Function(String) onSelected;

  const CustomFilterChipList({super.key, 
    required this.filterOptions,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        for (String option in filterOptions) ...[
          FilterChip(
            label: Text(option),
            onSelected: (bool value) {
              onSelected(option);
            },
          ),
          const SizedBox(width: 20),
        ],
      ],
    );
  }
}
