import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/home_page.dart';
import 'pages/bookmark_page.dart';
import 'themes/light_theme.dart';
import 'themes/dark_theme.dart';
import 'utils/session_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManager.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDark = SessionManager.isDarkMode ?? false;

  void _toggleTheme(bool v) {
    setState(() {
      _isDark = v;
      SessionManager.setDarkMode(v);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Comic Reader',
      theme: _isDark ? darkTheme : lightTheme,
      home: SessionManager.isLoggedIn ? HomePage(onToggleTheme: _toggleTheme, isDark: _isDark) : LoginPage(),
      routes: {
        '/login': (_) => LoginPage(),
        '/register': (_) => RegisterPage(),
        '/home': (_) => HomePage(onToggleTheme: _toggleTheme, isDark: _isDark),
        '/bookmark': (_) => BookmarkPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
