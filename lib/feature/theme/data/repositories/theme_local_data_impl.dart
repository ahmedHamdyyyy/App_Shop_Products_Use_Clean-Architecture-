import 'package:ana/feature/theme/data/local/data_sources/theme_local_data_sources.dart';
import 'package:ana/feature/theme/domain/repositories/theme_repo.dart';

class ThemeRepoImpl extends ThemeRepo{
  final ThemeLocalDataSource themeLocalDataSource;

  ThemeRepoImpl({required this.themeLocalDataSource});
  @override
  bool checkTheme() => themeLocalDataSource.checkTheme();


  @override
  int? getTheme() =>
    themeLocalDataSource.checkTheme()? themeLocalDataSource.getTheme()??0:0;


  @override
  Future<dynamic> setTheme({required int theme})async {
   return await themeLocalDataSource.setTheme(theme: theme);
  }
}