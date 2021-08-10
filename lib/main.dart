import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_flutter/blocs/internet_bloc.dart';
import 'package:travel_flutter/blocs/sign_in_bloc.dart';

import 'package:travel_flutter/pages/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EasyLocalization(
    supportedLocales: [
      Locale('en'),
      Locale('zh', 'TW'),
    ],
    path: 'assets/translations',
    fallbackLocale: Locale('en'),
    //startLocale: Locale('en'),
    useOnlyLangCode: true,
    child: TravelFlutterApp(),
  ));
}

class TravelFlutterApp extends StatefulWidget {
  const TravelFlutterApp({Key key}) : super(key: key);

  @override
  _TravelFlutterAppState createState() => _TravelFlutterAppState();
}

class _TravelFlutterAppState extends State<TravelFlutterApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<InternetBloc>(
          create: (context) => InternetBloc(),
        ),
        ChangeNotifierProvider<SignInBloc>(
          create: (context) => SignInBloc(),
        ),
      ],
      child: MaterialApp(
          supportedLocales: EasyLocalization.of(context).supportedLocales,
          localizationsDelegates: [EasyLocalization.of(context).delegate],
          locale: EasyLocalization.of(context).locale,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Colors.blueAccent,
              iconTheme: IconThemeData(color: Colors.grey[900]),
              fontFamily: 'Manrope',
              scaffoldBackgroundColor: Colors.grey[100],
              appBarTheme: AppBarTheme(
                  color: Colors.white,
                  elevation: 0,
                  iconTheme: IconThemeData(
                    color: Colors.grey[800],
                  ),
                  brightness:
                      Platform.isAndroid ? Brightness.dark : Brightness.light,
                  textTheme: TextTheme(
                      headline6: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Manrope',
                          color: Colors.grey[900])))),
          debugShowCheckedModeBanner: false,
          home: SplashPage()),
    );
  }
}
