import 'package:ana/feature/theme/domain/repositories/theme_repo.dart';

class CheckThemeUseCase{
  final ThemeRepo themeRepo;
 const CheckThemeUseCase({required this.themeRepo});
 bool checkTheme()=> themeRepo.checkTheme();

}