import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guga_portfolio/firebase_options.dart';
import 'package:guga_portfolio/pages/cubits/cubit/home_tabs_cubit.dart';
import 'package:guga_portfolio/pages/home_page.dart';
import 'package:guga_portfolio/pages/projects_page.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GugaLabs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => BlocProvider<HomeTabsCubit>(
              create: (context) => HomeTabsCubit(),
              child: const HomePage(),
            ),
        '/projects': (context) => const ProjectsPage(),
      },
    );
  }
}
