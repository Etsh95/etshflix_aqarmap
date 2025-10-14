import 'package:flutter/material.dart';

class VideoVoteAverage extends StatelessWidget {
  const VideoVoteAverage({required this.voteAverage, super.key});
  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 20,
            ),
            Text(
              ' ' + voteAverage.toStringAsFixed(1),
            ),
          ],
        )
      ],
    );
  }
}
