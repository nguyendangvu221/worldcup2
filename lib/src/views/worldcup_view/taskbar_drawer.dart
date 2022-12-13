import 'package:flutter/material.dart';

class TaskBarDrawer extends StatelessWidget {
  final IconData icon;
  final String content;
  const TaskBarDrawer({required this.icon, required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: (() {}),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(icon, color: Colors.black, size: 20),
              Expanded(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    content,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // const Divider(
        //   color: Color.fromARGB(255, 220, 220, 220),
        //   height: 1,
        //   thickness: 2,
        // )
      ],
    );
  }
}
