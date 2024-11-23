import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/block/create_post_block.dart';
import 'package:myapp/screen/note.dart';
import 'package:myapp/screen/physics_action.dart';


class CreatePost extends StatefulWidget {
  const CreatePost({super.key});


  @override
  State<StatefulWidget> createState() => _CreatePost();
  
}

class _CreatePost extends State<CreatePost> {

  final myHeaderController = TextEditingController();

  final mySubtitleController = TextEditingController();

  final myDescriptionController = TextEditingController();




  final block = CreatePostBlock(CreatedPostState());


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Новая активность',),
        actions: [
          IconButton(
            onPressed: () {
            final bloc = context.read<CreatePostBlock>();
            bloc.add(CreatePostEvent(note: Note(myHeaderController.text, mySubtitleController.text)));
            Navigator.pop(context);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const PhysicsAction()));
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(50),
        children: [
          TextField(
            controller: myHeaderController,
            style: const TextStyle(color: Colors.black), 
            textInputAction: TextInputAction.newline, 
            minLines: 1, 
            maxLines: 7,
            decoration: 
            const InputDecoration(
              hintText: 'Введите заголовок',
              border: OutlineInputBorder(),
            ),
          ),
          TextField(
            controller: mySubtitleController,
            style: const TextStyle(color: Colors.black), 
            textInputAction: TextInputAction.newline, 
            minLines: 1, 
            maxLines: 7,
            decoration: 
            const InputDecoration(
              hintText: 'Введите заметку',
              border: OutlineInputBorder(),
            ),
          ),
        ]
      ),
    );
  }
  
}