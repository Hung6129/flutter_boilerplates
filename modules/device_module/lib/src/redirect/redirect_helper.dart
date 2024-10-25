import 'package:url_launcher/url_launcher.dart';

class RedirectHelper {
  static Future<void> redirectToBrowser(
    String url, {
    bool launchOnExternalApplication = false,
  }) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: launchOnExternalApplication
            ? LaunchMode.externalApplication
            : LaunchMode.platformDefault,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
