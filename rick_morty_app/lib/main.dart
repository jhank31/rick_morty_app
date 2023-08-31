import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_morty_app/initial_bindings.dart';
import 'package:rick_morty_app/src/routes/routes.dart';
import 'package:rick_morty_app/src/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      title: 'Rick & Morty',
      theme: themeData(ThemeConfig.darkTheme),
      initialRoute: '/tabOptionsPage',
    );
  }
}

ThemeData themeData(ThemeData theme) {
  return theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(
      secondary: ThemeConfig.lightAccent,
    ),
    textTheme: GoogleFonts.sourceSansProTextTheme(
      theme.textTheme,
    ),
  );
}
