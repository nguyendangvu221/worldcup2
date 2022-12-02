import 'package:flutter/material.dart';

class Flags extends StatelessWidget {
  final String flag;

  const Flags({required this.flag, super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
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
