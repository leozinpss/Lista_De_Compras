import "package:flutter/material.dart";

class Sobre extends StatefulWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  State<Sobre> createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(157, 2, 2, 75),
      appBar: AppBar(
        title: const Text(
          "Sobre este projeto",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
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
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                "App para gerenciar compras:",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 25,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "O objetivo principal deste aplicativo é fornecer uma maneira simples e eficaz de gerenciar suas listas de compras de forma personalizada, para que você possa alcançar seus objetivos de compra com facilidade.",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Criador:",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Leonardo Pinheiro Siqueira - 835008",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
