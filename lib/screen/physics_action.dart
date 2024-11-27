import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/block/list_changed_block.dart';
import 'package:myapp/block/list_changed_event.dart';
import 'package:myapp/block/list_changed_state.dart';
import 'package:myapp/screen/note.dart';
import 'package:myapp/screen/post.dart';
import 'package:myapp/screen/create_post.dart';

  // var list =
  // [
  // // Note('Приседания1', 'Сколько раз присел1', "jfduhsbyufbubdfubeuidfsdf"), 
  // // Note('Приседания2', 'Сколько раз присел1', "jfduhsbyufbubdfubeuidfsdf"),
  // // Note('Приседания3', 'Сколько раз присел2', "jfduhsbyufbubdfubeuidfsdf"), 
  // // Note('Приседания', 'Сколько раз присел4', "jfduhsbyufbubdfubeuidfsdf"),
  // // Note('Приседания', 'Сколько раз присел3', "jfduhsbyufbubdfubeuidfsdf"),
  // // Note('Приседания', 'Сколько раз присел5', "jfduhsbyufbubdfubeuidfsdf"),
  // // Note('Приседания', 'Сколько раз присел', "jfduhsbyufbubdfubeuidfsdf"),
  // // Note('Приседания5', 'Сколько раз присел', "jfduhsbyufbubdfubeuidfsdf"),
  // // Note('Приседания', 'Сколько раз присел', "jfduhsbyufbubdfubeuidfsdf"),

  // ];

@RoutePage()
class PhysicsAction extends StatefulWidget {
  const PhysicsAction({super.key});


  @override
  State<StatefulWidget> createState() => _PhysicsAction();
}

class _PhysicsAction extends State<PhysicsAction> {

  final block = ListChangedBlock();

  List<Note> list = [];

  @override
  void initState() {
    super.initState();
    block.add(ListLoadedChangeEvent());
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Физические нагрузки'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Completer completer = Completer();
          block.add(ListLoadedChangeEvent(completer: completer));
        },
        child: BlocBuilder<ListChangedBlock, ListChangedState>(
          bloc: block,
          builder: (context, state) {
            if (state is ListLoadedState) {
              return ListView.separated(
                separatorBuilder: (context, i) => const Divider(color: Colors.black,),
                itemCount: state.myList.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(state.myList[index].title), 
                  subtitle: Text(state.myList[index].description),
                  tileColor: Colors.white,
                  trailing: PopupMenuButton(
                        itemBuilder: (context) { 
                          return [
                            const PopupMenuItem(value: 1, child: Row(
                              children: [SizedBox(child: Text('Открыть'),)],
                              ),
                            ),
                            const PopupMenuItem(value: 1, child: Row(
                              children: [SizedBox(child: Text('Редактировать'),)],
                              ),
                            ),
                            const PopupMenuItem(value: 1, child: Row(
                              children: [SizedBox(child: Text('Удалить'),)],
                              ),
                            ),
                            const PopupMenuItem(value: 1, child: Row(
                              children: [SizedBox(child: Text('Информация'),)],
                              ),
                            )
                        ];
                        },
                        ),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Post(state.myList[index].title, '${state.myList[index].description}\n \n ${state.myList[index].description}'))),
                )
              );
            } 
            if (state is EmptyListState) {
              return const Center(
                child: Text('Добавьте вашу первую заметку', style: TextStyle(color: Colors.black),
                  )
                );
              }
              return const Center(child: CircularProgressIndicator());
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>
         const CreatePost())), 
        child: const Icon(Icons.add),
      ), 
    );
  }

}