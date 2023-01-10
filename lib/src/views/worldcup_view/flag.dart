import 'package:flutter/material.dart';

class Flags extends StatelessWidget {
  final String flag;
  final double height;
  final double width;
  const Flags(
      {required this.width,
      required this.height,
      required this.flag,
      super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        // color: Colors.black,
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            flag,
          ),
        ),
      ),
    );
  }
}
