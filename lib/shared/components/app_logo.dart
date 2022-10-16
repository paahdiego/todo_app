import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
    this.size = 120,
  }) : super(key: key);

  final double? size;

  @override
  Widget build(BuildContext context) {
    return FlutterLogo(size: size);
  }
}
