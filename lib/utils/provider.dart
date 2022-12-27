import 'package:flutter/foundation.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
class BgButtonColor with ChangeNotifier, DiagnosticableTreeMixin {
  String _bgButtonColor = "0xFFFFFFFF";
  String get bgButtonColor => _bgButtonColor;

  void changeBgColor() {
    if (_bgButtonColor == "0xFFFFFFFF") {
      _bgButtonColor = "0xFF000000";
    } else {
      _bgButtonColor = "0xFFFFFFFF";
    }
    notifyListeners();
  }

  /// Makes `BgButtonColor` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('bgColor', bgButtonColor));
  }
}
