import 'package:chatbox/core/routes/routes.dart';
import 'package:chatbox/features/auth/login_screen.dart';
import 'package:chatbox/features/home/home_page.dart';
import 'package:chatbox/core/utils/colors.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'services/firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const Chatbox());
}

class Chatbox extends StatelessWidget {
  const Chatbox({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfing().init(context);
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Caros',
        colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark, seedColor: MyColors.kPrimaryColor),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Chatbox',
      routes: myRoutes,
      theme: ThemeData(
        fontFamily: 'Caros',
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: Colors.greenAccent,
        ),
        useMaterial3: true,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}
