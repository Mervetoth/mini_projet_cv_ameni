import 'package:flutter/material.dart';
import 'package:devfolio/components/animated_progress_indicator.dart';
import '../../../constants.dart';

class Coding extends StatelessWidget {
  const Coding({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text(
            "Codage",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: cardColor, // Set the color to the title color
                ),
          ),
        ),
        _buildProgressIndicator(context, "Dart", 0.7),
        _buildProgressIndicator(context, "Java", 0.68),
        _buildProgressIndicator(context, "HTML", 0.9),
        _buildProgressIndicator(context, "CSS", 0.75),
        _buildProgressIndicator(context, "JavaScript", 0.58),
      ],
    );
  }

  Widget _buildProgressIndicator(
      BuildContext context, String label, double percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: cardColor, // Set the color to the title color
                  ),
            ),
          ),
          Expanded(
            child: AnimatedLinearProgressIndicator(
              percentage: percentage,
              label: label, // Pass the label to the progress indicator
            ),
          ),
        ],
      ),
    );
  }
}
