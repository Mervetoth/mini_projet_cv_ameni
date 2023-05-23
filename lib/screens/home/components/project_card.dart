import 'package:flutter/material.dart';
import 'package:devfolio/models/Project.dart';
import 'package:devfolio/responsive.dart';
import '../../../constants.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      color: secondaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(project.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: text1,
                  )),
          SizedBox(
            height: 10,
          ),
          Text(project.description!,
              maxLines: Responsive.isMobileLarge(context) ? 4 : 5,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: bodyTextColor,
                  )),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {},
            child: Text("Voir plus >>",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: text1,
                    )),
          ),
        ],
      ),
    );
  }
}
