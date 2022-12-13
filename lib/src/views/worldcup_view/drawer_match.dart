import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:world_cup/src/views/worldcup_view/taskbar_drawer.dart';

class DrawerMatch extends StatelessWidget {
  const DrawerMatch({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                width: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "asset/co-san-bong-da-duoc-tao-ra-nhu-the-nao-5.jpg"),
                        fit: BoxFit.fill)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "WORLD CUP",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    OutlinedButton(
                      style: TextButton.styleFrom(
                          minimumSize: const Size(150, 40),
                          maximumSize: const Size(150, 100),
                          side: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          )),
                      onPressed: (() {}),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: Column(
                children: const [
                  TaskBarDrawer(
                    icon: Icons.settings,
                    content: "Setting",
                  ),
                  TaskBarDrawer(
                      icon: Icons.logout_outlined, content: "Log out"),
                  TaskBarDrawer(icon: Icons.info_outline, content: "Info")
                ],
              ))
        ],
      ),
    );
  }
}
