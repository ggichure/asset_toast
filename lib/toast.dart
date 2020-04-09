import 'package:flutter/material.dart';

class AssetToast {
  static final int lengthShort = 1;
  static final int lengthLong = 2;
  static final int bottom = 0;
  static final int center = 1;
  static final int top = 2;
  static void show(String msg, BuildContext context,
      {int duration = 1,
      int gravity = 0,
      Color backgroundColor = const Color(0xAA000000),
      textStyle = const TextStyle(fontSize: 15, color: Colors.white),
      Color prefixBadge = Colors.green,
      Color msgColor = Colors.white,
      String asset = ""}) {
    ToastView.dismiss();
    ToastView.createViewToast(msg, asset, context, duration, gravity,
        prefixBadge, msgColor, backgroundColor, textStyle);
  }
}

class ToastView {
  static final ToastView _singleton = new ToastView._internal();

  factory ToastView() {
    return _singleton;
  }

  ToastView._internal();
  static OverlayState overlayState;
  static OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static void createViewToast(
    String msg,
    String asset,
    BuildContext context,
    int duration,
    int gravity,
    Color prefixBadge,
    Color msgColor,
    Color backgroundColor,
    TextStyle textStyle,
  ) async {
    overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = backgroundColor;

    _overlayEntry = OverlayEntry(
        builder: (BuildContext context) => ToastWidget(
              widget: Container(
                width: MediaQuery.of(context).size.width * .9,
                child: Card(
                  elevation: 0.0,
                  color: (backgroundColor != null)
                      ? backgroundColor
                      : Theme.of(context).primaryColor,
                  margin: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      (prefixBadge != null)
                          ? Container(
                              width: 10.0,
                              height: 60.0,
                              color: prefixBadge,
                            )
                          : Container(),
                      (asset != null)
                          ? Container(
                              margin: const EdgeInsets.all(5.0),
                              width: 50,
                              height: 50,
                              child: Image.asset(
                                asset,
                                width: 50,
                                height: 50,
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.all(20.0),
                            ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            (msg != null)
                                ? Container(
                                    alignment: Alignment.centerLeft,
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      msg,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: (msgColor != null)
                                              ? msgColor
                                              : Colors.white),
                                    ))
                                : Container(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              gravity: gravity,
            ));
    _isVisible = true;
    overlayState.insert(_overlayEntry);
    await new Future.delayed(Duration(
        seconds: duration == null ? AssetToast.lengthShort : duration));
    dismiss();
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}

class ToastWidget extends StatelessWidget {
  ToastWidget({
    Key key,
    @required this.widget,
    @required this.gravity,
  }) : super(key: key);

  final Widget widget;
  final int gravity;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
        top: gravity == 2 ? MediaQuery.of(context).viewInsets.top + 50 : null,
        bottom:
            gravity == 0 ? MediaQuery.of(context).viewInsets.bottom + 50 : null,
        child: Material(
          color: Colors.transparent,
          child: widget,
        ));
  }
}
