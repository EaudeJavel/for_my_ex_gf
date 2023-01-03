import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:no_more_anxiety/theme.dart';

/// Mix-in [DiagnosticableTreeMixin] to have access to [debugFillProperties] for the devtool
class OnDarkMode with ChangeNotifier, DiagnosticableTreeMixin {
  bool _onDarkMode = false;
  bool get onDarkMode => _onDarkMode;

  Color get bgDarkmode => _onDarkMode
      ? myAppTheme.primaryColorDark
      : myAppTheme.colorScheme.primary;

  Color get textDarkmode => _onDarkMode
      ? myAppTheme.colorScheme.primary
      : myAppTheme.primaryColorDark;

  Color get appbarSelectedDarkmode =>
      _onDarkMode ? myAppTheme.colorScheme.tertiary : myAppTheme.primaryColor;

  void changeBgColor() {
    _onDarkMode = !_onDarkMode;
    if (kDebugMode) {
      print('Darkmode: $_onDarkMode');
      print('bgColor: ${bgDarkmode.toString()}');
    }
    notifyListeners();
  }

  /// Makes `BgButtonColor` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('darkmode', _onDarkMode.toString()));
  }
}
