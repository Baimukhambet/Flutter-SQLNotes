import 'package:flutter/material.dart';
import 'package:sql_notes/pages/home_page.dart';
import 'package:sql_notes/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      home: HomePage(),
    );
  }
}
