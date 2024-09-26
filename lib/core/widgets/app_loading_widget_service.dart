import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

abstract class AppLoadingWidgetService {
  static OverlayEntry? _overlayEntry;

  static void showLoading(BuildContext context) {
    if (_overlayEntry == null) {
      OverlayState overlayState = Overlay.of(context);
      _overlayEntry = OverlayEntry(
        builder: (context) {
          return Material(
            color: Colors.transparent.withOpacity(0.5),
            child: Center(
              child: _LoadingWidget(),
            ),
          );
        },
      );
      overlayState.insert(_overlayEntry!);
    }
  }

  static void hideLoading() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();

  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      color: Colors.white,
      size: 30,
    );
  }
}
