import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const PrimaryButton({
    Key? key,
    this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // backgroundColor: Colors.blue.shade800,
        // disabledBackgroundColor: Colors.blue.shade200,
        // foregroundColor: Colors.white,
        // disabledForegroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 0,
        fixedSize: const Size(double.infinity, 50),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
