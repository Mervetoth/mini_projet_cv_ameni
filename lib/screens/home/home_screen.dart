import 'package:flutter/material.dart';
import 'package:devfolio/screens/main/main_screen.dart';
import 'components/home_banner.dart';
import 'components/my_projects.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      children: [
        Container(
            padding: EdgeInsets.only(right: 20),
            child: Column(
              children: [
                HomeBanner(),
                MyProjects(),
              ],
            ))
      ],
    );
  }
}
