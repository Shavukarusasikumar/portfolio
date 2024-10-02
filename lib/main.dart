import 'package:flutter/material.dart';
import 'package:my_portifolio/firebase_options.dart';
import 'package:my_portifolio/models/pages/HomePage.dart';
import 'package:my_portifolio/models/pages/ProjectDetailsPage.dart';
import 'package:my_portifolio/models/project.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Portfolio',
          theme: themeProvider.getTheme(),
          home: HomePage(),
          onGenerateRoute: (settings) {
            if (settings.name == '/') {
              return MaterialPageRoute(builder: (context) => HomePage());
            } else if (settings.name!.startsWith('/project/')) {
              final projectId = int.parse(settings.name!.split('/').last);
              final project = projects.firstWhere((p) => p.id == projectId);
              return MaterialPageRoute(
                builder: (context) => ProjectDetailsPage(project: project),
              );
            }
            return null;
          },
          onUnknownRoute: (settings) {
            return MaterialPageRoute(builder: (context) => HomePage());
          },
        );
      },
    );
  }
}