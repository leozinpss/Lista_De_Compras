import 'package:flutter/material.dart';
import 'package:app_de_compras/modelo_lista.dart';
import 'package:app_de_compras/telas/tela_lista_itens.dart';

class MinhasListas extends StatefulWidget {
  @override
  _MinhasListasState createState() => _MinhasListasState();
}

class _MinhasListasState extends State<MinhasListas> {
  final TextEditingController nomeListaController = TextEditingController();
  List<Lista_compras> minhasListas = [];

  void criarLista(String nomeLista) {
    if (nomeLista.isNotEmpty) {
      setState(() {
        minhasListas.add(Lista_compras(nome: nomeLista, itens: []));
        nomeListaController.clear();
      });
    } else {
      _mostrarAlerta(
          "Lista Sem Nome", "Por favor, forneça um nome para a lista.");
    }
  }

  void apagarLista(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Apagar Lista",
          ),
          content: const Text(
            "Tem certeza de que deseja apagar esta lista?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  minhasListas.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text("Sim"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Não"),
            ),
          ],
        );
      },
    );
  }

  void editarLista(int index) {
    TextEditingController novoNomeController =
        TextEditingController(text: minhasListas[index].nome);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Nome da Lista",
          ),
          content: TextField(
            controller: novoNomeController,
            decoration: const InputDecoration(
              labelText: "Nome",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  minhasListas[index] = Lista_compras(
                      nome: novoNomeController.text,
                      itens: minhasListas[index].itens);
                });
                Navigator.of(context).pop();
              },
              child: const Text("Salvar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }

  void _mostrarAlerta(String titulo, String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(mensagem),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(157, 2, 2, 75),
      appBar: AppBar(
        title: const Text(
          "Minhas Listas",
          style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              color: const Color.fromARGB(255, 22, 29, 32),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      "Criar Nova Lista",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 25),
                      controller: nomeListaController,
                      decoration: const InputDecoration(
                        labelText: "Nome da Lista",
                        labelStyle: TextStyle(
                          color:
                              Color.fromARGB(255, 255, 255, 255), // Escolha a cor que você deseja aqui.
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        criarLista(nomeListaController.text);
                      },
                      child: const Text("Criar Lista"),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Suas Listas:",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: minhasListas.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(minhasListas[index].nome),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            editarLista(index);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            apagarLista(index);
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ListaDeItens(minhasListas[index]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
