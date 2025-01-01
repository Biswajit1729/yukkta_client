import 'package:flutter/material.dart';

const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 360;
const int customeScreenSize = 1366;

class ResponsiveHelper extends StatelessWidget {
  final Widget smallDevice;
  final Widget largDevice;
  const ResponsiveHelper({
    Key? key,
    required this.smallDevice,
    required this.largDevice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, snapshot) {
      if (snapshot.maxWidth < 600) {
        return smallDevice;
      } else {
        return largDevice;
      }
    });
  }
}
