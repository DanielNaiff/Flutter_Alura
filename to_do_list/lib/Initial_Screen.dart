import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/task.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tarefas')),
      body: AnimatedOpacity(
        opacity: opacidade ? 1 : 0,
        duration: const Duration(milliseconds: 250),
        child: ListView(
          //scrollDirection: Axis.horizontal, caso eu quisesse na horizontal
          children: const [
            Task(
              nome: 'Aprender Flutter',
              foto:
                  'https://imgv3.fotor.com/images/cover-photo-image/a-beautiful-girl-with-gray-hair-and-lucxy-neckless-generated-by-Fotor-AI.jpg',
              dificuldade: 3,
            ),
            Task(
              nome: 'Andar de bike',
              foto:
                  'https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              dificuldade: 2,
            ),
            Task(
              nome: 'Meditar andando de bike e cozinhando uma abóbora',
              foto: 'https://scx2.b-cdn.net/gfx/news/2015/imagestereoa.jpg',
              dificuldade: 5,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacidade = !opacidade;
            });
          },
          child: const Icon(Icons.remove_red_eye)),
    );
  }
}
