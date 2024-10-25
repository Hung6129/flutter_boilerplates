import 'dart:io';
import 'dart:typed_data';

import 'package:share_plus/share_plus.dart';

final class SharingHelper {
  static Future<void> shareText(String text, {String? title}) {
    return Share.share(text, subject: title);
  }

  static Future<void> shareFile(File file, {String? title}) {
    final xFile = XFile(file.path, bytes: file.readAsBytesSync());
    return Share.shareXFiles([xFile], subject: title);
  }
  static Future<void> shareBytes(Uint8List bytes, {String? title, String? name}) {
    final xFile = XFile.fromData(bytes, mimeType: 'png', name:name);
    return Share.shareXFiles([xFile], subject: title);
  }
}
