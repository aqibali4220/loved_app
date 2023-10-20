import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: white,
        strokeWidth: 4,
      ),
    );
  }
}
