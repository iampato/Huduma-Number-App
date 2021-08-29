import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:huduma/screens/history_page.dart';
import 'package:huduma/utils/moor_utils.dart';
import 'package:provider/provider.dart';
import 'cubit/huduma_repo_dao.dart';
import 'screens/home_page.dart';

void main() {
  runApp(MyApp());
  //
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  //
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<HudumaResponseDao>(
      create: (_) => MyDatabase().hudumaResponseDao,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
          fontFamily: GoogleFonts.openSans().fontFamily,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            elevation: 0.0,
            brightness: Brightness.dark,
          ),
        ),
        initialRoute: "/",
        onGenerateRoute: (settings) {
          if (settings.name == "/") {
            return CupertinoPageRoute(builder: (_) => MyHomePage());
          } else if (settings.name == "/history") {
            return CupertinoPageRoute(builder: (_) => HistoryPage());
          } else {
            return null;
          }
        },
      ),
    );
  }
}
