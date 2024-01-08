
import 'package:ana/feature/theme/domain/repositories/theme_repo.dart';

class SetThemeUseCase{
 final ThemeRepo themeRepo;
 const SetThemeUseCase({required this.themeRepo});

 Future<dynamic> setTheme({required int theme})async =>
     await themeRepo.setTheme(theme: theme);

}