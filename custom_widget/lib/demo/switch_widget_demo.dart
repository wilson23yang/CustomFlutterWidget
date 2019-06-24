import 'package:custom_widget/custom_widget.dart';
import 'package:custom_widget/utils/adaptive_util.dart';
import 'package:flutter/material.dart';

class SwitchDemo {
  CustomSwitch sw = CustomSwitch(
    value: true,
    onChanged: (bool value) {},
    activeColor: Colors.white,
    inactiveColor: Colors.white.withOpacity(0.4),
    thumbColor: Colors.blue,
    inactiveThumbColor: Colors.grey,
    width: Adaptive.width(26),
    height: Adaptive.width(13),
  );
}
