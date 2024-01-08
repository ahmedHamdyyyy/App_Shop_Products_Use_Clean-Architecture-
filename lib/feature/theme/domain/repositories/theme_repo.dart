abstract class ThemeRepo {
  int? getTheme();
  Future<dynamic> setTheme({required int theme});
  bool checkTheme();
}