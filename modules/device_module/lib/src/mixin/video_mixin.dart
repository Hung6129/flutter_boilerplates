import 'dart:async';
import 'dart:math';

import 'package:device_module/src/mixin/media_status.dart';
import 'package:device_module/src/permission/device_permission_handler.dart';
import 'package:file_picker/file_picker.dart';

mixin VideoMixin {
  final _mediaState = MediaState.instance;

  Future<Status> requestVideoPermission() async {
    final status = await DevicePermissionHandler.requestPhoto();
    return switch (status) {
      PermissionStatus.denied => Status.denied,
      PermissionStatus.granted => Status.granted,
      PermissionStatus.restricted => Status.restricted,
      PermissionStatus.limited => Status.limited,
      PermissionStatus.permanentlyDenied => Status.permanentlyDenied,
      PermissionStatus.provisional => Status.provisional,
    };
  }

  Future<VideoModel?> getVideoFromGallery({
    int maxSizeOfMB = 10,
    String mimeType = 'mp4/mov',
  }) async {
    final picker = FilePicker.platform; //ImagePicker();
    final video = await picker.pickFiles(
      // source: ImageSource.gallery,
      // preferredCameraDevice: CameraDevice.front,
      // maxDuration: const Duration(seconds: 130),
      type: FileType.video,
    );
    if (video != null && video.files.isNotEmpty == true) {
      final videoType = video.files.first.name.split('.').last;
      if (!mimeType.contains(videoType.toLowerCase())) {
        onInvalidMimeType();
        return null;
      }

      _mediaState.updateMediaState(MediaStateType.calculatingLength);

      final _fileSize = await video.files.first.size;

      await Future<void>.delayed(const Duration(seconds: 2));

      _mediaState.updateMediaState(MediaStateType.successful);

      if (_fileSize > maxSizeOfMB * 1024 * 1024) {
        onExceedingPermittedLimitsSize();
        return null;
      } else {
        final _videoModel = VideoModel(
          path: video.files.first.path!,
          fileName: video.files.first.name,
        );

        return _videoModel;
      }
    }

    return null;
  }

  void _getFileSize(int fileLength) {
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    var i = (log(fileLength) / log(1024)).floor();
    final size =
        ((fileLength / pow(1024, i)).toStringAsFixed(2)) + ' ' + suffixes[i];
    print('file size $size');
  }

  void onExceedingPermittedLimitsSize();

  void onInvalidMimeType();
}

final class VideoModel {
  final String path;
  final String fileName;

  VideoModel({
    required this.path,
    required this.fileName,
  });
}
