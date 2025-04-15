import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tiktok/config/app_theme.dart';
import 'presentation/providers/providers_exports.dart';
import 'presentation/screens/screens_exports.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => HomeProvider()..loadNextPage() 
        )
      ],
      child: MaterialApp(
        title: 'Flutter TikTok',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const HomeScreen()
      ),
    );
  }
}