import 'package:flutter/material.dart';

import '../../../constants.dart';

class AreaInfoText extends StatelessWidget {
  const AreaInfoText({
    Key? key,
    this.title,
    this.text,
  }) : super(key: key);

  final String? title, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title!,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: cardColor,
                  )),
          Text(text!,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: text2Color,
                  )),
        ],
      ),
    );
  }
}
