import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_api_simple_call/screen/home_screen/provider/home_provider.dart';
import 'package:news_api_simple_call/screen/home_screen/view/home_scrre.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomeProvider(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const HomeScreen(),
          },
        )),
  );
}
