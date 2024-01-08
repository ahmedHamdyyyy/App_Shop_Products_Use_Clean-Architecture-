import 'package:ana/config/constants/constance.dart';
import 'package:ana/feature/theme/domain/use_cases/getTheme_UseCase.dart';
import 'package:ana/feature/theme/domain/use_cases/set_theme_UseCase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit( {required this.setThemeUseCase,required this.getThemeUseCase}) : super(const ThemeState());
final GetThemeUseCase getThemeUseCase;
final SetThemeUseCase setThemeUseCase;

  void setTheme(int theme) async{
    try {
      emit(state.copyWith(getThemeState: Status.loading));
      final themeResponse = theme == 1 ? 0 : 1;
      await setThemeUseCase.setTheme(theme: themeResponse);
      emit(state.copyWith(theme: themeResponse, getThemeState: Status.success));
    } catch (e) {

      emit(state.copyWith(getThemeState: Status.error,));
         }
  }
  void getTheme() {
    emit(state.copyWith(getThemeState: Status.loading));
    final theme=getThemeUseCase.getTheme();
    emit(state.copyWith(theme: theme,getThemeState: Status.success));

  }
}
