import 'package:custom_widget/demo/commom_popupmenu_button.dart';

class PopuMenuWidgetDemo {
  var managerWidget = CommonPopupMenuButton(
    imagePath: '../more.png',
    items: [
      CommonPopupMenuItem(title: '订单记录'),
      CommonPopupMenuItem(title: '广告管理'),
      CommonPopupMenuItem(title: '收款方式')
    ],
    callback: (value) {
      switch (value) {
        case '订单记录':
          break;
        case '广告管理':
          break;
        case '收款方式':
          break;
        default:
          break;
      }
    },
  );
}
