import "package:flutter/material.dart";
import "package:app_de_compras/telas/tela_lista_compras.dart";
import "package:app_de_compras/telas/tela_de_cadastro.dart";
import "package:app_de_compras/telas/tela_sobre_projeto.dart";

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formKey = GlobalKey<FormState>();
  var status = false;
  var emailvalid = TextEditingController();
  var senhavalid = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(157, 2, 2, 75),
      body: Column(children: [
        Container(
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 80),
                  const SizedBox(
                      height: 20,
                    ),
                  const Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 30, color: Color.fromARGB(255, 255, 227, 227)),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 250, 241, 241),
                        fontSize: 20),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      errorStyle: TextStyle(
                          color: Color.fromARGB(255, 224, 34, 21),
                          fontSize: 20),
                      labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    controller: emailvalid,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Você tem que digitar um email";
                      }
                      if (!value.contains("@")) {
                        return "E-mail invalido";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    obscureText: true,
                    autofocus: true,
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Senha",
                        errorStyle: TextStyle(
                            color: Color.fromARGB(255, 224, 34, 21),
                            fontSize: 20),
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 20)),
                    controller: senhavalid,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Você precisa digitar uma senha";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 120, 98, 230),
                        foregroundColor:
                            const Color.fromARGB(255, 0, 0, 0),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (emailvalid.text == "leozin@hotmail.com" &&
                              senhavalid.text == "123") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MinhasListas()),
                            );
                          } else {
                            ScaffoldMessenger.of(context)
                               .showSnackBar(const SnackBar(
                                content: Text("Email ou senha inválidos"),
                                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                                duration: Duration(seconds: 2),
                                )
                                );
                          }
                        }
                      },
                      child: const Text(
                        "Entrar",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      )),
                  const SizedBox(height: 25),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Cadastro()),
                      );
                    },
                    child: const Text(
                      "Cadastrar",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 17, 39, 201),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Sobre()),
                      );
                    },
                    child: const Text(
                      "Sobre o projeto",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
