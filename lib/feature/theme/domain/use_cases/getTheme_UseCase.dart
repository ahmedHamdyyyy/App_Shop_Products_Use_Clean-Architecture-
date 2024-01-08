
import '../repositories/theme_repo.dart';

class GetThemeUseCase{
   final ThemeRepo themeRepo;

 const GetThemeUseCase({required this.themeRepo});
int? getTheme()=> themeRepo.getTheme();

}