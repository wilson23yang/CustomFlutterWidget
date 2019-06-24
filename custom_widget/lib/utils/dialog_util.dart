import 'dart:async';
import 'package:custom_widget/utils/adaptive_util.dart';
import 'package:flutter/material.dart';

class DialogUtil {
  static void showSimpleDialog({
    @required BuildContext context,
    String title,
    @required String content,
    String confirmText,
    Function confirmCallback,
    Alignment titleAlignment,
    Widget child,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return _CustomDialog(
            title: title,
            content: content,
            confirmText: confirmText,
            confirmCallback: confirmCallback,
            titleAlignment: titleAlignment,
            hideCancelBtn: true,
            child: child,
          );
        });
  }

  static void showActionDialog(
      {@required BuildContext context,
      String title,
      @required String content,
      String cancelText,
      String confirmText,
      Function cancelCallback,
      Function confirmCallback,
      Alignment titleAlignment,
      Alignment contentAlignment,
      Widget child,
      bool hideTitle = false}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return _CustomDialog(
            title: title,
            content: content,
            cancelText: cancelText,
            confirmText: confirmText,
            cancelCallback: cancelCallback,
            confirmCallback: confirmCallback,
            titleAlignment: titleAlignment,
            child: child,
            hideTitle: hideTitle,
            contentAlignment: contentAlignment,
          );
        });
  }

//  static Future toastFuture;
  static Future showToastDialog(
      {@required BuildContext context,
      String icon,
      String content,
      String subContent,
      bool barrierDismissible = true,
      Duration duration = const Duration(milliseconds: 1000)}) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final ThemeData theme = Theme.of(buildContext, shadowThemeOnly: true);
        final Widget pageChild = Builder(builder: (context) {
          return _ToastDialog(
            icon: icon,
            content: content,
            subContent: subContent,
          );
        });
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Color(0x01000000),
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    ).timeout(duration, onTimeout: () {
      Navigator.of(context).pop();
    });
  }



  static Future showMyToastDialog({
    @required BuildContext context,
    @required Widget chidWidget,
    Duration duration,
  }) {
    // toastShowing = true;
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
        final Widget pageChild = Builder(builder: (context) {
          return chidWidget;
        });
        return SafeArea(
          child: Builder(builder: (BuildContext context) {
            return theme != null
                ? Theme(data: theme, child: pageChild)
                : pageChild;
          }),
        );
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Color(0x01000000),
      transitionDuration: const Duration(milliseconds: 150),
      transitionBuilder: _buildMaterialDialogTransitions,
    ).timeout(duration, onTimeout: () {
      print('time out');
      // toastShowing = false;
      Navigator.of(context).pop();
    });
  }
}

Widget _buildMaterialDialogTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

class _CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final String cancelText;
  final String confirmText;
  final Function cancelCallback;
  final Function confirmCallback;
  final Alignment titleAlignment;
  final Alignment contentAlignment;
  final bool hideCancelBtn;
  final bool hideTitle;
  final Widget child;

  _CustomDialog({
    this.title,
    this.content,
    this.cancelText,
    this.confirmText,
    this.cancelCallback,
    this.confirmCallback,
    this.titleAlignment,
    this.contentAlignment,
    this.hideCancelBtn = false,
    this.hideTitle = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Card(
            color: Colors.white,
            elevation: 0,
            margin: EdgeInsets.all(
              Adaptive.width(30),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Adaptive.width(8))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  alignment: titleAlignment ?? Alignment.center,
                  padding: EdgeInsets.only(
                    top: Adaptive.width(19),
                    bottom: Adaptive.width(13),
                    left: Adaptive.width(12),
                    right: Adaptive.width(12),
                  ),
                  child: hideTitle
                      ? Container(width: 0, height: 0)
                      : Text(
                          title ?? '提示',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: Adaptive.width(15),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
                Container(
                  alignment: contentAlignment ?? Alignment.topLeft,
                  padding: EdgeInsets.only(
                    top: Adaptive.width(13),
                    bottom: Adaptive.width(15),
                    left: Adaptive.width(12),
                    right: Adaptive.width(12),
                  ),
                  child: Text(
                    content,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: Adaptive.width(15),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  // padding: EdgeInsets.only(
                  //   top: Adaptive.width(13),
                  //   bottom: Adaptive.width(15),
                  //   left: Adaptive.width(12),
                  //   right: Adaptive.width(12),
                  // ),
                  child: child ??
                      Container(
                        height: 0,
                      ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: Adaptive.width(15),
                    bottom: Adaptive.width(12),
                    left: Adaptive.width(8),
                    right: Adaptive.width(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Visibility(
                        visible: !hideCancelBtn,
                        child: Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: Adaptive.width(4),
                              right: Adaptive.width(4),
                            ),
                            child: FlatButton(
                              color: Color(0xFFD8D8D8),
                              padding: EdgeInsets.only(
                                bottom: Adaptive.width(12),
                                top: Adaptive.width(12),
                              ),
                              child: Text(
                                cancelText ?? '取消',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: Adaptive.width(14),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                                if (cancelCallback != null) {
                                  cancelCallback();
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: Adaptive.width(4),
                            right: Adaptive.width(4),
                          ),
                          child: FlatButton(
                            color: Colors.yellow,
                            padding: EdgeInsets.only(
                              bottom: Adaptive.width(12),
                              top: Adaptive.width(12),
                            ),
                            child: Text(
                              confirmText ?? '确认',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: Adaptive.width(14),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              if (confirmCallback != null) {
                                confirmCallback();
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ToastDialog extends StatelessWidget {
  final String icon;
  final String content;
  final String subContent;

  _ToastDialog({this.content, this.icon, this.subContent});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Card(
            color: Color(0xFF393939),
            elevation: 0,
            margin: EdgeInsets.all(
              Adaptive.width(62),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Adaptive.width(0))),
            child: Padding(
              padding: const EdgeInsets.all(13),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      (icon?.isNotEmpty ?? false)
                          ? Image.asset(icon)
                          : Container(
                              width: 0,
                              height: 0,
                            ),
                      Flexible(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.only(left: Adaptive.width(7.33)),
                          child: Text(
                            content,
                            style: TextStyle(
                              color: Color(0xFFDFDFDF),
                              fontSize: Adaptive.width(13.33),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  subContent != null
                      ? Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: Adaptive.width(7)),
                          child: Text(
                            subContent,
                            style: TextStyle(
                                fontSize: Adaptive.width(10.67),
                                color: Color(0xFF969696)),
                          ),
                        )
                      : Container(
                          height: 0,
                          width: 0,
                        )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
