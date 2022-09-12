import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather/Modules/HomeScreen/HomeScreen.dart';
import 'package:weather/Shared/Network/Remote/DioHelper.dart';
import 'package:weather/Shared/Styles/Themes.dart';
import 'package:flutter/services.dart';

import 'Shared/BlocObserver/BlocObserver.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.white, // sta
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark// tus bar color
  ));
  DioHelper.init();


  BlocOverrides.runZoned(
        () {
          runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      theme: lightTheme,
      themeMode: ThemeMode.light,
      home: HomeScreen(),
    );
  }
}
