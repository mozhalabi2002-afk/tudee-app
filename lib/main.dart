import 'package:flutter/material.dart';
import 'services/hive_service.dart';
import 'services/storage_service.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  final userName = await StorageService.getUserName();

  runApp(TudeeApp(initialName: userName));
}

class TudeeApp extends StatelessWidget {
  final String? initialName;

  const TudeeApp({super.key, this.initialName});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tudee',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFDECEB),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4FC3F7),
          elevation: 0,
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: (initialName != null && initialName!.isNotEmpty)
          ? HomeScreen(userName: initialName!)
          : const WelcomeScreen(),
    );
  }
}
