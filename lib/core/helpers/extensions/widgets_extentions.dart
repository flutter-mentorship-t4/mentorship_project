import 'package:flutter/material.dart';

extension WidgetExtension on Widget? {
  /// With custom height and width
  SizedBox widthAndHeight({double width = 0.0, double height = 0.0}) {
    return SizedBox(height: height, width: width, child: this);
  }

  /// Scrollable
  SingleChildScrollView scrollable() => SingleChildScrollView(child: this);

  /// With custom width
  SizedBox width(double width) => SizedBox(width: width, child: this);

  /// With custom height
  SizedBox withHeight(double height) => SizedBox(height: height, child: this);

  /// return padding top
  Padding paddingTop(double top) {
    return Padding(padding: EdgeInsets.only(top: top), child: this);
  }

  /// return padding left
  Padding paddingStart(double start) {
    return Padding(
        padding: EdgeInsetsDirectional.only(start: start), child: this);
  }

  /// return padding end
  Padding paddingEnd(double end) {
    return Padding(padding: EdgeInsetsDirectional.only(end: end), child: this);
  }

  /// return padding bottom
  Padding paddingBottom(double bottom) {
    return Padding(padding: EdgeInsets.only(bottom: bottom), child: this);
  }

  /// return padding all
  Padding paddingAll(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this);
  }

  /// return custom padding from each side
  Padding paddingOnly({
    double top = 0.0,
    double start = 0.0,
    double bottom = 0.0,
    double end = 0.0,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(start, top, end, bottom),
      child: this,
    );
  }

  /// return padding symmetric
  Padding paddingSymmetric({double vertical = 0.0, double horizontal = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }

  /// add scaling to parent widget
  Widget scale({
    required double scale,
    Offset? origin,
    AlignmentGeometry? alignment,
    bool transformHitTests = true,
  }) {
    return Transform.scale(
      scale: scale,
      origin: origin,
      alignment: alignment,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  /// add rotation to parent widget
  Widget rotate({
    required double angle,
    bool transformHitTests = true,
    Offset? origin,
  }) {
    return Transform.rotate(
      origin: origin,
      angle: angle,
      transformHitTests: transformHitTests,
      child: this,
    );
  }

  /// set visibility
  Widget visible(bool visible, {Widget? defaultWidget}) {
    return visible ? this! : (defaultWidget ?? const SizedBox());
  }

  /// set parent widget in center
  Widget center({double? heightFactor, double? widthFactor}) {
    return Center(
      heightFactor: heightFactor,
      widthFactor: widthFactor,
      child: this,
    );
  }

  /// add tap to parent widget
  Widget onTap(
    Function()? function, {
    BorderRadius? borderRadius,
    Color? splashColor,
    Color? hoverColor,
    Color? highlightColor,
  }) {
    return InkWell(
      onTap: function,
      borderRadius: borderRadius,
      splashColor: splashColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      child: this,
    );
  }

  /// add Expanded to parent widget
  Widget expanded({flex = 1}) => Expanded(flex: flex, child: this!);

  /// add Flexible to parent widget
  Widget flexible({flex = 1, FlexFit? fit}) {
    return Flexible(flex: flex, fit: fit ?? FlexFit.loose, child: this!);
  }

  /// add FittedBox to parent widget
  Widget fit({BoxFit? fit, AlignmentGeometry? alignment}) {
    return FittedBox(
      fit: fit ?? BoxFit.contain,
      alignment: alignment ?? Alignment.center,
      child: this,
    );
  }

  /// Validate given widget is not null and returns given value if null.
  Widget validate({Widget value = const SizedBox()}) => this ?? value;

  @Deprecated('Use withTooltip() instead')
  Widget tooltip({required String msg}) {
    return Tooltip(message: msg, child: this);
  }

  /// Validate given widget is not null and returns given value if null.
  Widget withTooltip({required String msg}) {
    return Tooltip(message: msg, child: this);
  }
}
