import 'package:change_theme_example/core/theme/app_themes.dart';
import 'package:change_theme_example/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/dyamic_theme_cubit.dart';
import 'cubit/dynamic_theme_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(const ThemeSwitcherApp()),
    storage: storage,
  );
}

class ThemeSwitcherApp extends StatelessWidget {
  const ThemeSwitcherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DynamicThemeCubit>(
      lazy: false,
      create: (context) => DynamicThemeCubit(),
      child: BlocBuilder<DynamicThemeCubit, DynamicThemeState>(
          builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appThemeData[state.theme],
          home: const HomePage(),
        );
      }),
    );
  }
}
