import 'package:flutter/material.dart';

class AppDefaultButton extends StatelessWidget {
  const AppDefaultButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
          ),
      child: child,
    );
  }
}
