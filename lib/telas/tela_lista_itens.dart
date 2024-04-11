import "package:flutter/material.dart";
import "package:app_de_compras/modelo_lista.dart";

class ListaDeItens extends StatefulWidget {
  final Lista_compras listaDeCompras;

  ListaDeItens(this.listaDeCompras);

  @override
  _listaDeComprasState createState() => _listaDeComprasState();
}

class _listaDeComprasState extends State<ListaDeItens> {
  final TextEditingController nomeItemController = TextEditingController();
  List<int> quantidades = [];
  bool? isChecked = false;
  String pesquisa = "";

  void adicionarItem(String nomeItem) {
    setState(() {
      widget.listaDeCompras.itens.add(nomeItem);
      quantidades.add(0);
      nomeItemController.clear();
    });
  }

  void editarNomeItem(int index) {
    TextEditingController novoNomeController =
        TextEditingController(text: widget.listaDeCompras.itens[index]);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 253, 252, 252),
          title: const Text(
            "Nome do item",
            style: TextStyle(color: Color.fromARGB(255, 21, 21, 21)),
          ),
          content: TextField(
            style: const TextStyle(
                color: Color.fromARGB(255, 21, 21, 21), fontSize: 20),
            controller: novoNomeController,
            decoration: const InputDecoration(
              labelText: "Nome",
              labelStyle: TextStyle(
                  color: Color.fromARGB(255, 21, 21, 21), fontSize: 20),
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  widget.listaDeCompras.itens[index] = novoNomeController.text;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(157, 2, 2, 75),
      appBar: AppBar(
        title: Text(
          widget.listaDeCompras.nome,
          style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              const SizedBox(height: 25),
              TextField(
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 25),
                controller: nomeItemController,
                decoration: const InputDecoration(
                  labelText: "Nome do item",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 25),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 120, 98, 230),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                onPressed: () {
                  adicionarItem(nomeItemController.text);
                },
                child: const Text(
                  "Adicionar Item",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Lista de itens:",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              TextField(
                style: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255), fontSize: 25),
                onChanged: (value) {
                  setState(() {
                    pesquisa = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: "Pesquisar item",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255), fontSize: 25),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.listaDeCompras.itens.length,
                  itemBuilder: (context, index) {
                    if (pesquisa.isEmpty ||
                        widget.listaDeCompras.itens[index].contains(pesquisa)) {
                      return Card(
                        child: ListTile(
                          title: Row(
                            children: [
                              Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value;
                                  });
                                },
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  editarNomeItem(index);
                                },
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(widget.listaDeCompras.itens[index]),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                quantidades[index].toString(),
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    quantidades[index]++;
                                  });
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    if (quantidades[index] > 0) {
                                      quantidades[index]--;
                                    }
                                  });
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    widget.listaDeCompras.itens.removeAt(index);
                                    quantidades.removeAt(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const SizedBox.shrink();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
