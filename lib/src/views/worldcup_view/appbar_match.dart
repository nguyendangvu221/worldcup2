import 'package:flutter/material.dart';

class AppBarMatch extends StatelessWidget {
  const AppBarMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: const Text("MATCH"),
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search_rounded))
      ],
      leading: IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(Icons.menu_sharp)),
    );
  }
}
