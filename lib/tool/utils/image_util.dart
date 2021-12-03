import 'dart:async';

import 'package:flutter/widgets.dart';

/// Image Util.
class ImageUtil {

  /// Suggest use ImageUtil instead.
  ///
  /// get image width height，load error return Rect.zero.（unit px）
  /// Gif is not supported.
  /// 获取图片宽高，加载错误情况返回 Rect.zero.（单位 px）
  /// image
  /// url network
  /// local url , package
  static Future<Rect> getImageWH({
    Image? image,
    String? url,
    String? localUrl,
    String? package,
    ImageConfiguration? configuration,
  }) {
    if (image == null &&
        (url == null || url.isEmpty) &&
        (localUrl == null || localUrl.isEmpty)) {
      return Future.value(Rect.zero);
    }
    Completer<Rect> completer = Completer<Rect>();
    Image? img = image;
    if (img == null) {
      img = (url != null && url.isNotEmpty)
          ? Image.network(url)
          : Image.asset(localUrl!, package: package);
    }
    img.image
        .resolve(configuration ?? ImageConfiguration())
        .addListener(ImageStreamListener(
          (ImageInfo info, bool synchronousCall) {
        if (!completer.isCompleted) {
          completer.complete(Rect.fromLTWH(0, 0,
              info.image.width.toDouble(), info.image.height.toDouble()));
        }
      },
      onError: (dynamic exception, StackTrace? stackTrace) {
        if (!completer.isCompleted) {
          completer.complete(Rect.zero);
        }
      },
    ));
    return completer.future;
  }

}
