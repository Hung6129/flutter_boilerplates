import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:device_module/src/mixin/media_status.dart';
import 'package:device_module/src/permission/device_permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:image/image.dart' as img;
import 'package:image/image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

mixin PhotoMixin {
  final _mediaState = MediaState.instance;

  Future<Status> requestCameraPermission() async {
    final status = await DevicePermissionHandler.requestCamera();
    return switch (status) {
      PermissionStatus.denied => Status.denied,
      PermissionStatus.granted => Status.granted,
      PermissionStatus.restricted => Status.restricted,
      PermissionStatus.limited => Status.limited,
      PermissionStatus.permanentlyDenied => Status.permanentlyDenied,
      PermissionStatus.provisional => Status.provisional,
    };
  }

  Future<Status> requestPhotoPermission() async {
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

  Future<File?> pickImageFromGallery() async {
    await _checkStatusPermission();
    final picker = ImagePicker();
    final photo = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1080,
      maxWidth: 1080,
      imageQuality: 80,
    );
    if (photo != null) {
      final file = await File.fromUri(Uri.file(photo.path));
      final fileSize = await file.readAsBytes();
      debugPrint('File Path: ${photo.path}');
      debugPrint('file size ${fileSize.length}');
      return file;
    }

    return null;
  }

  Future<File?> pickImageFromGalleryToScanQR() async {
    final status = await requestPhotoPermission();
    if (status == Status.permanentlyDenied) {
      await openAppSettings();
    }
    final picker = ImagePicker();
    final photo = await picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    if (photo != null) {
      if (Platform.isIOS && photo.path.toLowerCase().endsWith('.png')) {
        final img = await decodePngFile(photo.path);
        await encodeJpgFile(photo.path, img!);
      }
      _mediaState.updateMediaState(MediaStateType.calculatingLength);
      final file = await File.fromUri(Uri.file(photo.path));
      final fileSize = await file.readAsBytes();
      debugPrint('File Path: ${photo.path}');
      debugPrint('file size ${fileSize.length}');

      _mediaState.updateMediaState(MediaStateType.successful);
      return file;
    }

    return null;
  }

  Future<PhotoPickerResult?> pickPhotoFromGallery(
      {int maxSizeOfKB = 500}) async {
    await _checkStatusPermission();
    final picker = FilePicker.platform;
    final photo = await picker.pickFiles(
      type: FileType.image,
      compressionQuality: 60,
    );
    if (photo != null && photo.files.isNotEmpty) {
      _mediaState.updateMediaState(MediaStateType.calculatingLength);
      final isValidSize = photo.files.first.size <= (1024 * maxSizeOfKB);
      if (!isValidSize) {
        // final file = await FileUtils.compressAndGetFile(photo.files.first);
        await Future<void>.delayed(const Duration(seconds: 1));
        _mediaState.updateMediaState(MediaStateType.successful);
        // return PhotoPickerResult(
        //   name: file.name,
        //   path: file.path,
        //   size: file.size,
        //   bytes: file.bytes,
        // );
        onExceedingPermittedLimitsSize();
        return null;
      }

      _mediaState.updateMediaState(MediaStateType.successful);

      final file = photo.files.first;

      return PhotoPickerResult(
        name: file.name,
        path: file.path,
        size: file.size,
        bytes: file.bytes,
      );
    }

    return null;
  }

  Future<List<PhotoPickerResult>> pickMultiplePhotoFromGallery({
    int maxFileSelection = 1,
    int maximumTotalSizeOfMb = 5,
  }) async {
    await _checkStatusPermission();

    final picker = FilePicker.platform; //ImagePicker();
    final photos = <PlatformFile>[];

    final photo = await picker.pickFiles(
      type: FileType.image,
      compressionQuality: 60,
      allowMultiple: true,
    );

    if (photo != null) {
      photo.files.removeWhere((element) => ['jpg', 'jpeg', 'png'].contains(element.extension) == false);
      photos.addAll(photo.files);

      if (photos.isNotEmpty) {
        _mediaState.updateMediaState(MediaStateType.calculatingLength);
        var totalLength = 0;
        final files = photos.take(maxFileSelection).toList();
        await Future.forEach(files, (element) async {
          final fileLength = element.size;
          return totalLength += fileLength;
        });

        final isValidSize = totalLength <=
            (maximumTotalSizeOfMb * 1024 * 1024 * maxFileSelection);
        _mediaState.updateMediaState(MediaStateType.successful);
        if (!isValidSize) {
          onExceedingPermittedLimitsSize();
          return [];
        }

        return files
            .map((e) => PhotoPickerResult(
                  name: e.name,
                  path: e.path,
                  size: e.size,
                  bytes: e.bytes,
                ))
            .toList();
      }
    }

    return [];
  }

  Future<img.Image?> fileToImage(File file) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    final capturedImage = await img.decodeImage(await file.readAsBytesSync());

    return capturedImage;
  }

  Future<File> imageToFileFromUnknownPath(img.Image image) async {
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/avatar.png')
        .writeAsBytes(img.encodePng(image));
    unawaited(file.length().then(_getFileSize));
    return file;
  }

  void _getFileSize(int fileLength) {
    const suffixes = ['B', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    var i = (log(fileLength) / log(1024)).floor();
    final size =
        ((fileLength / pow(1024, i)).toStringAsFixed(2)) + ' ' + suffixes[i];
    print('file size $size');
  }

  Future<void> _checkStatusPermission() async {
    final status = await requestPhotoPermission();
    if (status == Status.permanentlyDenied || status == Status.denied) {
      await openAppSettings();
    }
    throwIf(status == Status.denied || status == Status.permanentlyDenied, DeniedPermission());
  }

  void onExceedingPermittedLimitsSize();
}

final class DeniedPermission extends IOException {}

final class ExceedingPermittedLimitsSize extends IOException {}

final class PhotoPickerResult {
  final String name;
  final String? path;
  final int size;
  final Uint8List? bytes;

  PhotoPickerResult({
    required this.name,
    required this.path,
    required this.size,
    this.bytes,
  });
}
