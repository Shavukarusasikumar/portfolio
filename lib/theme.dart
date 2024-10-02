import 'package:flutter/material.dart';
import 'package:my_portifolio/models/pages/HomePage.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  ThemeData getTheme() {
    return _isDarkMode ? _darkTheme : _lightTheme;
  }

  static final ThemeData _lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: Color(0xFF2196F3),
    hintColor: Color(0xFF03A9F4),
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Color(0xFFF5F5F5),
    textTheme: TextTheme(
      headline3: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      headline4: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
      headline6: TextStyle(color: Colors.black87),
      subtitle1: TextStyle(color: Colors.black54),
      bodyText1: TextStyle(color: Colors.black87),
      bodyText2: TextStyle(color: Colors.black54),
    ),
    iconTheme: IconThemeData(color: Color(0xFF2196F3)),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFF2196F3),
      textTheme: ButtonTextTheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF2196F3)),
      ),
    ),
  );

  static final ThemeData _darkTheme = ThemeData(
    primaryColor: Color(0xFF1976D2),
    hintColor: Color(0xFF03A9F4),
    scaffoldBackgroundColor: Color(0xFF1E1E1E),
    textTheme: TextTheme(
      displaySmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(color: Colors.white),
      titleMedium: TextStyle(color: Colors.white70),
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
    iconTheme: IconThemeData(color: Color(0xFF03A9F4)),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xFF03A9F4),
      textTheme: ButtonTextTheme.primary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF03A9F4)),
      ),
    ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: Color(0xFF121212)),
  );
}



class NavigationProvider extends ChangeNotifier {
  String _currentPage = 'home';
  Function(String)? _scrollCallback;

  String get currentPage => _currentPage;

  void setPage(String page) {
    _currentPage = page;
    if (_scrollCallback != null) {
      _scrollCallback!(page);
    }
    notifyListeners();
  }

  void setScrollCallback(Function(String) callback) {
    _scrollCallback = callback;
  }
}

class ThemeToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return IconButton(
          icon: Icon(themeProvider.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
          onPressed: () {
            themeProvider.toggleTheme();
          },
        );
      },
    );
  }
}