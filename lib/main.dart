import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/block/create_post_block.dart';
import 'package:myapp/block/list_changed_block.dart';
import 'package:myapp/theme/theme.dart';
import 'package:myapp/screen/main_screen.dart';

void main() {
  runApp(const Wrapper());
}

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreatePostBlock>(
          create: (context) => CreatePostBlock(CreatedPostState())
          ), 
        BlocProvider<ListChangedBlock>(
          create: (context) => ListChangedBlock(),
          )
        ],
      child: const MyApp()     
    );
  }
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Дневник здоровья',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mainBarColor),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
          ),
          bodyLarge:  TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          bodySmall:  TextStyle(
            fontFamily: 'Roboto',
            color: Color.fromARGB(255, 31, 6, 6),
            // fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Дневник здоровья'),
    );
  }
}

