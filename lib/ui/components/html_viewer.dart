import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHtmlViewer extends StatelessWidget {
  final String html;
  final EdgeInsetsGeometry padding;

  const AppHtmlViewer({
    super.key,
    required this.html,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bodyColor = theme.textTheme.bodyMedium?.color;
    final titleColor = theme.textTheme.titleLarge?.color;

    return Padding(
      padding: padding,
      child: Html(
        data: html,
        onLinkTap: (url, _, __) async {
          if (url == null) return;
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        style: {
          "body": Style(
            color: bodyColor,
            fontSize: FontSize(16),
            lineHeight: LineHeight(1.5),
            margin: Margins.zero,
          ),
          "p": Style(margin: Margins.only(bottom: 12)),
          "h1": Style(color: titleColor, fontSize: FontSize(26), margin: Margins.only(bottom: 12)),
          "h2": Style(color: titleColor, fontSize: FontSize(22), margin: Margins.only(bottom: 10)),
          "h3": Style(color: titleColor, fontSize: FontSize(20), margin: Margins.only(bottom: 8)),
          "ul": Style(margin: Margins.only(bottom: 12, left: 16)),
          "ol": Style(margin: Margins.only(bottom: 12, left: 16)),
          "a": Style(
            color: theme.colorScheme.primary,
            textDecoration: TextDecoration.underline,
          ),
          "code": Style(
            backgroundColor: theme.colorScheme.surfaceVariant.withOpacity(0.3),
            padding: HtmlPaddings.all(6),
            border: Border.all(color: theme.dividerColor, width: 1, style: BorderStyle.solid),
            fontFamily: "monospace",
          ),
          "img": Style(
            // imagens responsivas
            width: Width.auto(),
            height: Height.auto(),
          ),
          "table": Style(
            border: Border.all(color: theme.dividerColor),
          ),
          "th": Style(
            backgroundColor: theme.colorScheme.surfaceVariant,
            padding: HtmlPaddings.all(8),
          ),
          "td": Style(
            padding: HtmlPaddings.all(8),
            border: Border.all(color: theme.dividerColor),
          ),
        },
      ),
    );
  }
}
