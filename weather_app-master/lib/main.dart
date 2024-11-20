import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapi/logic/bloc/weather_bloc/weather_bloc.dart';
import 'package:weatherapi/presentation/screens/main_screens/options.dart';
import 'package:weatherapi/presentation/themes/dartk_theme.dart';
import 'package:weatherapi/presentation/themes/light_theme.dart';
import 'package:weatherapi/presentation/themes/theme_manager.dart';



import 'locals/shared.dart';
import 'presentation/screens/main_screens/home_screen.dart';
import 'presentation/screens/start/onboarding_screen.dart';

import 'presentation/screens/start/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  static ThemeManager themeManager = ThemeManager();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override void dispose() {
    MyApp.themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    MyApp.themeManager.toggleTheme(Shared.getBOOL(key: "isDark"));
    MyApp.themeManager.addListener(themeListener);
    super.initState();
  }

  void themeListener(){
    if (mounted){
      setState(() {
        
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      themeMode: MyApp.themeManager.themeMode ,
      routes: {
        '/': (context) => SplashScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/home': (context) => BlocProvider(
              create: (context) => WeatherBloc()..add(FetchWeatherData()),
              child: HomeScreen(),
            ),
        '/options': (context) => Options(),
      },
    );
  }
}
