import 'package:dummy_phone_login/screens/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dummy Login App',
      theme: ThemeData(
        // textTheme: GoogleFonts.lexendDecaTextTheme(
        //   Theme.of(context).textTheme,
        // ),
        // colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE44533)),
        useMaterial3: true,
      ),
      home: const FirstScreen(),
    );
  }
}
