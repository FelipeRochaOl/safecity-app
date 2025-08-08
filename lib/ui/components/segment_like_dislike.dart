import 'package:flutter/material.dart';

enum Calendar { like, dislike, none }

class SegmentLikeDislike extends StatefulWidget {
  final int likeCount;
  final int dislikeCount;
  const SegmentLikeDislike({super.key, this.likeCount = 0, this.dislikeCount = 0});

  @override
  State<SegmentLikeDislike> createState() => _SegmentLikeDislikeState();
}

class _SegmentLikeDislikeState extends State<SegmentLikeDislike> {
  Calendar calendarView = Calendar.none;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
          value: Calendar.like,
          label: Text(widget.likeCount.toString()),
          icon: Icon(Icons.thumb_up),
        ),
        ButtonSegment<Calendar>(
          value: Calendar.dislike,
          label: Text(widget.likeCount.toString()),
          icon: Icon(Icons.thumb_down),
        ),
      ],
      selected: {calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        if (newSelection.isEmpty) {
          newSelection = {Calendar.none};
        }
        setState(() {
          calendarView = newSelection.first;
        });
      },
    );
  }
}