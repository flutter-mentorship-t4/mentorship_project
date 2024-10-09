import 'package:flutter/material.dart';

import '../../../../core/config/theming/colors.dart';

class SizeCircle extends StatelessWidget {
  final bool selected;
  final String size;

  const SizeCircle({
    required this.selected,
    required this.size,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selected ? ColorsManager.primaryColor : ColorsManager.lightPrimary,
      ),
      child: SizedBox(
        width: 32,
        height: 32,
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: selected ? ColorsManager.lightPrimary : ColorsManager.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
