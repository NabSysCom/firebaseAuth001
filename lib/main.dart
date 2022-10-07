import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flatterfire/authintication_services/authintication_anonymously.dart';
import 'package:flatterfire/authintication_services/authintication_status.dart';
import 'package:flatterfire/screens_authintacation/sigin_in.dart';
import 'package:flatterfire/screens_members/members_home.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'screens_members/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Provider.debugCheckInvalidValueType = null;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthinticationStatus()),
        ChangeNotifierProvider(create: (_) => AuthinticationAninymously()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'فايربيز'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget myPage = const SplashScreen();
    return Consumer<AuthinticationStatus>(
      builder: (context, appStatus, _) {
        switch (appStatus.loginState) {
          case ApplicationStatus.checking:
            myPage = const SplashScreen();
            break;

          case ApplicationStatus.loggedOut:
            myPage = const SiginIn();
            break;

          case ApplicationStatus.loggedIn:
            myPage = const MembersHome();
            break;

          default:
            myPage = const SplashScreen();
        }
        return myPage;
      },
      child: myPage,
    );
  }
}
