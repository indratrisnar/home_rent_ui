import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_rent_ui/models/home.dart';
import 'package:home_rent_ui/pages/detail_page.dart';
import 'package:home_rent_ui/pages/menu_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffFAFAFA),
        textTheme: GoogleFonts.ralewayTextTheme(),
      ),
      home: const MenuPage(),
      routes: {
        '/detail': (context) {
          Home home = ModalRoute.of(context)!.settings.arguments as Home;
          return DetailPage(home: home);
        }
      },
    );
  }
}
