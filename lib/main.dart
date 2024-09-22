import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingo_panda_assignment/core/config/theme_config.dart';
import 'package:lingo_panda_assignment/features/auth/bloc/auth_bloc.dart';
import 'package:lingo_panda_assignment/features/auth/screens/sign_up_screen.dart';
import 'package:lingo_panda_assignment/features/auth/services/auth_services.dart';
import 'package:lingo_panda_assignment/features/comments/screens/comment_screen.dart';
import 'package:lingo_panda_assignment/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((val) {
    // this will setup remote config when the firebase is setup.
    // this will slow the app for a bit but it's okay because it's a one time thing
    // in future we can run an isolate on it to make it faster.
    // I don't have time to do that now.
    setupRemoteConfig();
  });
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => AuthBloc()),
    ], child: const MyApp()),
  );
}

/// [setupRemoteConfig] is used to setup the remote config for the app and get the values from the remote config
void setupRemoteConfig() async {
  final config = FirebaseRemoteConfig.instance;

  await config.setDefaults({'showFullEmail': false});

  await config.fetchAndActivate();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<User?> checkIfUserExists() async {
    final AuthServices authServices = AuthServices();
    final user = await authServices.checkUserLoggedIn();
    return user;
  }

  @override
  Widget build(BuildContext context) {
    // checking if the user is already logged in or not

    return MaterialApp(
      title: 'LingoPanda Assignment',
      // Using the light theme as default
      // There is no dark theme in the app, so we can use the light theme directly
      theme: ThemeConfig.lightTheme,
      // Removing the debug banner because it's a sore to the eyes
      debugShowCheckedModeBanner: false,
      // Since there are no toggle buttons to switch theme, we can use the ThemeMode directly
      // in future if we want to add toggle button -> Use Provider with ChangeAppNotifier to change the theme
      themeMode: ThemeConfig.isDark ? ThemeMode.dark : ThemeMode.light,
      // By default Screen is signup screen.
      // Creating a future builder which check if the user exists or not.
      home: FutureBuilder(future: checkIfUserExists(), builder: (context, snapshot) {
        if(snapshot.hasData) {
          return snapshot.data == null ? const SignUpScreen() : const CommentScreen();
        } else {
          return const SignUpScreen();
        }
      }),
    );
  }
}
