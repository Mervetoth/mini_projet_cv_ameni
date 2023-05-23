import 'package:flutter/material.dart';

import '../../../constants.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color: Color(0xFF242150),
        child: Column(
          children: [
            Spacer(flex: 2),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage("assets/images/IMG_7344.jpg"),
            ),
            Spacer(),
            Text(
              "Ben Rbiha Ameni",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: title,
                  ),
            ),
            Text(
              "Développeuse web et mobile & \n Designer graphique",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: text1,
                  ),
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
