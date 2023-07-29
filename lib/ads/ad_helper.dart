import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return ''; // ca-app-pub
    } else if (Platform.isIOS) {
      return ''; // ca-app-pub
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}
