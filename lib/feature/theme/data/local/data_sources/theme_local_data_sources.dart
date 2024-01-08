import 'package:ana/config/constants/constance.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/services/service_locator.dart';

abstract class ThemeLocalDataSource {
  int? getTheme();
  Future<dynamic> setTheme({required int theme});
  bool checkTheme();
}

class ThemeLocalDataSourceImpl extends ThemeLocalDataSource {

  @override
  bool checkTheme() => getIt<SharedPreferences>().containsKey(AppConst.theme);

  @override
  int? getTheme() {
    return getIt<SharedPreferences>().getInt(AppConst.theme);
  }

  @override
  Future<dynamic> setTheme({required int theme}) async =>
     await getIt<SharedPreferences>().setInt(AppConst.theme, theme);

}
