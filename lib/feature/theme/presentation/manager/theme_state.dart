part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final Status getThemeState;
  final Status setThemeState;
  final int theme;

  const ThemeState({
    this.getThemeState = Status.loading,
    this.setThemeState = Status.loading,
    this.theme = 0,
  });

  ThemeState copyWith({
    Status? getThemeState,
    Status? setThemeState,
    int? theme,
  }) {
    return ThemeState(
      getThemeState: getThemeState ?? this.getThemeState,
      setThemeState: setThemeState ?? this.setThemeState,
      theme: theme ?? this.theme,
    );
  }

  @override
  List<Object> get props => [
        getThemeState,
        theme,
        setThemeState,
      ];
}
