import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'shared/theme.dart';
import 'ui/pages/main_page.dart';
import 'ui/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MainApp(
    savedThemeMode: savedThemeMode,
  ));
}

class MainApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MainApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => DestinationCubit()),
      ],
      child: AdaptiveTheme(
        light: lightTheme,
        dark: darkTheme,
        initial: AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Adaptive Theme Demo',
          theme: theme,
          darkTheme: darkTheme,
          routes: {
            '/': (context) => const SplashPage(),
            '/main': (context) => const MainPage(),
          },
        ),
      ),
    );
  }
}
