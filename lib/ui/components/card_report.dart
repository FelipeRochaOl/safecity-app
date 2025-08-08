import 'package:flutter/material.dart';
import 'package:safecity/ui/components/elevated_button.dart';
import 'package:safecity/ui/components/segment_like_dislike.dart';
import 'package:safecity/ui/components/timer_text.dart';
import 'package:safecity/ui/screens/report_detail_page.dart';
import 'package:safecity/ui/styles/fonts.dart';

class AppCardReport extends StatelessWidget {
  final String title;
  final String description;
  final String dateTime;
  final String imageUrl;

  const AppCardReport({super.key, required this.title, required this.description, required this.dateTime, this.imageUrl = 'assets/report_placeholder.png'});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      imageUrl,
                      width: 279,
                      height: 185,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8.0),
                    AppTimerText(dateTime: dateTime),
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Título: $title',
                      style: TextStyle(fontSize: AppFonts.bodyFontSize),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Descrição: $description',
                      style: TextStyle(fontSize: AppFonts.bodyFontSize),
                    ),
                    SizedBox(height: 8),
                    AppElevatedButton(
                      onPressed: () => _handleOpenReportDetails(context),
                      text: 'Rota de fuga',
                      icon: Icons.arrow_forward,
                      afterIcon: true,
                      alignment: MainAxisAlignment.center,
                    ),
                    SizedBox(height: 8),
                    Center(child: SegmentLikeDislike())
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _handleOpenReportDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReportDetailPage(),
      ),
    );
  }
}
