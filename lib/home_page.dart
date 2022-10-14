import 'package:change_theme_example/cubit/dyamic_theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_themes.dart';
import 'cubit/dynamic_theme_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // do nothing
        },
        child: const Icon(
          Icons.done,
        ),
      ),
      body: const MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DynamicThemeCubit, DynamicThemeState>(
      builder: (context, state) => ListView.builder(
        itemCount: AppThemes.values.length,
        itemBuilder: (context, index) => ElevatedButton(
            onPressed: () {
              context
                  .read<DynamicThemeCubit>()
                  .changeTheme(AppThemes.values[index]);
            },
            child: Text(AppThemes.values[index].name)),
      ),
    );
  }
}
