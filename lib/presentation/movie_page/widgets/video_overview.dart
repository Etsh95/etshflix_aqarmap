import 'package:flutter/material.dart';

class VideoOverview extends StatelessWidget {
  const VideoOverview({required this.overview, super.key});
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Overview', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        SizedBox(height: 10),
        Text(overview,
          style: Theme.of(context).primaryTextTheme.bodyMedium,
        ),
      ],
    );
  }
}
