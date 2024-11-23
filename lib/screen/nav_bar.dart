import 'package:flutter/material.dart';
import 'package:myapp/theme/theme.dart';
import 'package:myapp/screen/physics_action.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: mainDrawerColor,
            ),
            child: Text('Дневник здоровья'),
            ),
            ListTile(
              title: const Text('Физическая нагрузка'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PhysicsAction(),)),
            ),
              ListTile(
              title: const Text('Сон'),
              onTap: () {
                
              },
            ),
            ListTile(
              title: const Text('Диета'),
              onTap: () {
                
              },
            ),
            ListTile(
              title: const Text('Лекарства'),
              onTap: () {
                
              },
            ),
            ListTile(
              title: const Text('Заметки'),
              onTap: () {
                
              },
            ),
            ListTile(
              title: const Text('Самочувствие'),
              onTap: () {
                
              },
            ),
            ListTile(
              title: const Text('Количество выпитой жидкости'),
              onTap: () {
                
              },
            ),
              ListTile(
              title: const Text('Привычки'),
              onTap: () {
                
              },
            ),
          ],
      ),
    );
  }
}