import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/listin.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Listin> listListins = [];
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listin - Feira Colaborativa"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showFormModal();
        },
        child: const Icon(Icons.add),
      ),
      body: (listListins.isEmpty)
          ? const Center(
              child: Text(
                "Nenhuma lista ainda.\nVamos criar a primeira?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView(
              children: List.generate(
                listListins.length,
                (index) {
                  Listin model = listListins[index];
                  return ListTile(
                    leading: const Icon(Icons.list_alt_rounded),
                    title: Text(model.name),
                    subtitle: Text(model.id),
                  );
                },
              ),
            ),
    );
  }

  showFormModal() {
    // Labels à serem mostradas no Modal
    String labelTitle = "Adicionar Listin";
    String labelConfirmationButton = "Salvar";
    String labelSkipButton = "Cancelar";

    // Controlador do campo que receberá o nome do Listin
    TextEditingController nameController = TextEditingController();

    // Função do Flutter que mostra o modal na tela
    showModalBottomSheet(
      context: context,

      // Define que as bordas verticais serão arredondadas
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(32.0),

          // Formulário com Título, Campo e Botões
          child: ListView(
            children: [
              Text(labelTitle, style: Theme.of(context).textTheme.headline5),
              TextFormField(
                controller: nameController,
                decoration:
                    const InputDecoration(label: Text("Nome do Listin")),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(labelSkipButton),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Criar um objeto Listin com as infos
                      Listin listin = Listin(
                        id: const Uuid().v1(),
                        name: nameController.text,
                      );

                      // Salvar no Firestore
                      firestore
                          .collection("listins")
                          .doc(listin.id)
                          .set(listin.toMap());

                      // Fechar o Modal
                      Navigator.pop(context);
                    },
                    child: Text(labelConfirmationButton),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
