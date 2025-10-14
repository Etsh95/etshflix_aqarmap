import 'package:flutter/material.dart';

class VideoReleaseDate extends StatelessWidget {
  const VideoReleaseDate({required this.releaseDate, super.key});
  final DateTime releaseDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.calendar_month, size: 20, color: Colors.grey),
        Text(' ' + releaseDate.toString().split(' ')[0], style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
