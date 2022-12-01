import 'package:flutter/material.dart';

class Flags extends StatelessWidget {
  const Flags({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.pexels.com/photos/301599/pexels-photo-301599.jpeg"))),
    ));
  }
}
