import 'package:bloc/bloc.dart';
import 'package:change_theme_example/core/theme/app_themes.dart';
import 'package:change_theme_example/cubit/dynamic_theme_state.dart';
import 'package:meta/meta.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class DynamicThemeCubit extends HydratedCubit<DynamicThemeState> {
  DynamicThemeCubit() : super(DynamicThemeState(AppThemes.lightTheme));

  void changeTheme(AppThemes theme) => emit(DynamicThemeState(theme));

  @override
  DynamicThemeState? fromJson(Map<String, dynamic> json) {
    final theme = json['theme'];
    final currentTheme =
        AppThemes.values.firstWhere((e) => e.toString() == theme);
    return DynamicThemeState(currentTheme);
  }

  @override
  Map<String, dynamic>? toJson(DynamicThemeState state) {
    final theme = {'theme': state.theme.toString()};
    return theme;
  }
}
