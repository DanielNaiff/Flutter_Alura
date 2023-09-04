import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/dificuldade.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  //classe myApp extende do stateless
  MainApp({super.key});
  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  //construtor
  bool opacidade = true;

  @override
  Widget build(BuildContext context) {
    //fucncao que retorna um widget
    return MaterialApp(
      //parâmetros nomeados
      home: Scaffold(
        appBar: AppBar(title: const Text('Tarefas')),
        body: AnimatedOpacity(
          opacity: opacidade ? 1 : 0,
          duration: const Duration(milliseconds: 250),
          child: ListView(
            //scrollDirection: Axis.horizontal, caso eu quisesse na horizontal
            children: [
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
            child: Icon(Icons.remove_red_eye)),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  const Task(
      {super.key,
      required this.nome,
      required this.foto,
      required this.dificuldade});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), //Espaçamento entre os cartões
      child: Container(
        child: Stack(
          children: [
            Container(
              height: 140,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: Colors.blue),
            ),
            Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(widget.foto, fit: BoxFit.cover),
                        ),
                      ),
                      //limitação da String
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              widget.nome,
                              style: const TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Dificuldade(
                            dificuldade: widget.dificuldade,
                          )
                        ],
                      ),
                      Container(
                        height: 52,
                        width: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(
                              () {
                                nivel++;
                              },
                            );
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'Lvl Up',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 200,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? (nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                      ),
                      Text('Nível: $nivel',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
