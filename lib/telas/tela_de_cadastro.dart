import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  var formKey = GlobalKey<FormState>();
  var status = false;
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(157, 2, 2, 75),
      appBar: AppBar(
        title: const Text(
          'Novo Cadastro',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 22, 29, 32),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Preencha os campos abaixo:',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: txtNome,
                  autofocus: true,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 22),
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: txtEmail,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 22),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu email.';
                    }
                    if (!value.contains('@')) {
                      return 'Email inválido.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: txtSenha,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 22),
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua senha.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      // logica de cadastro
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
