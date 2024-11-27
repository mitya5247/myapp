import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:myapp/database/DatabaseHelper.dart';
import 'package:myapp/screen/nav_bar.dart';
import 'package:myapp/screen/note.dart';


List<Note> mainPhysicsList = [];

@RoutePage()
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  DatabaseHelper dbHelp = DatabaseHelper();

  int _counter = 0;

  int counter_2 = 10;

  @override
  void initState() {
    loadDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        drawer: const NavBar(),
        body: const Center(
          child: Text('Расскажи о себе..', style: TextStyle(color: Colors.black),),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {},
          child: const Icon(Icons.add),
        ), 
      );
      
  }

  
  void loadDatabase() async {
    await DatabaseHelper.db();
  }
}
