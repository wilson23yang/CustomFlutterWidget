
class KLineIndex {
  static const String min_Hour_Menu = '分时';
  static const String min_1_Menu    = '1分钟';
  static const String min_5_Menu    = '5分钟';
  static const String min_15_Menu   = '15分钟';
  static const String min_30_Menu   = '30分钟';
  static const String hour_1_Menu   = '1小时';
  static const String hour_4_Menu   = '4小时';
  static const String day_1_Menu    = '日线';
  static const String week_1_Menu   = '1周';
  static const String month_1_Menu  = '1月';

  static const String min_Hour_Param  = '1m';
  static const String min_1_Param     = '1m';
  static const String min_5_Param     = '5m';
  static const String min_15_Param    = '15m';
  static const String min_30_Param    = '30m';
  static const String hour_1_Param    = '1h';
  static const String hour_4_Param    = '4h';
  static const String day_1_Param     = '1d';
  static const String week_1_Param    = '1w';
  static const String month_1_Param   = '1M';

  static const double min_Hour_Duration   = 60 * 1000.0;
  static const double min_1_Duration      = 60 * 1000.0;
  static const double min_5_Duration      = 60 * 1000.0 * 5;
  static const double min_15_Duration     = 60 * 1000.0 * 15;
  static const double min_30_Duration     = 60 * 1000.0 * 30;
  static const double hour_1_Duration     = 60 * 1000.0 * 60 * 1;
  static const double hour_4_Duration     = 60 * 1000.0 * 60 * 4;
  static const double day_1_Duration      = 60 * 1000.0 * 60 * 24;
  static const double week_1_Duration     = 60 * 1000.0 * 60 * 24 * 7;
  static const double month_1_Duration    = 60 * 1000.0 * 60 * 24 * 30;

//  static const String moreItem = '更多';

  static String getIndexParam(String menu){
    switch(menu){
      case min_Hour_Menu:
        return min_Hour_Param;
        break;
      case min_1_Menu:
        return min_1_Param;
        break;
      case min_5_Menu:
        return min_5_Param;
        break;
      case min_15_Menu:
        return min_15_Param;
        break;
      case min_30_Menu:
        return min_30_Param;
        break;
      case hour_1_Menu:
        return hour_1_Param;
        break;
      case hour_4_Menu:
        return hour_4_Param;
        break;
      case day_1_Menu:
        return day_1_Param;
        break;
      case week_1_Menu:
        return week_1_Param;
        break;
      case month_1_Menu:
        return month_1_Param;
        break;
      default:
        return min_1_Param;
        break;

    }
  }

  static double getIndexDuration(String menu){
    switch(menu){
      case min_Hour_Menu:
        return min_Hour_Duration;
        break;
      case min_1_Menu:
        return min_1_Duration;
        break;
      case min_5_Menu:
        return min_5_Duration;
        break;
      case min_15_Menu:
        return min_15_Duration;
        break;
      case min_30_Menu:
        return min_30_Duration;
        break;
      case hour_1_Menu:
        return hour_1_Duration;
        break;
      case hour_4_Menu:
        return hour_4_Duration;
        break;
      case day_1_Menu:
        return day_1_Duration;
        break;
      case week_1_Menu:
        return week_1_Duration;
        break;
      case month_1_Menu:
        return month_1_Duration;
        break;
      default:
        return min_1_Duration;
        break;
    }
  }
}