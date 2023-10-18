import 'package:flutter/material.dart';
import 'package:jogo_memoria/widgets/Button.dart';
import 'package:jogo_memoria/widgets/CheckboxField.dart';
import 'package:jogo_memoria/widgets/InputField.dart';
import 'package:jogo_memoria/widgets/Navbar.dart';
import 'package:jogo_memoria/widgets/texts/Header1.dart';
import 'package:jogo_memoria/widgets/texts/Header2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();

  Map<String, bool> cardTypes = {
    "imagens": false,
    "numeros": false,
  };

  Map<String, String> warningTypes = {
    "none": "",
    "no-name": "Digite seu nome",
    "no-tipo-carta": "Selecione pelo menos um tipo de carta",
    "no-name-and-no-tipo-carta":
        "Digite seu nome e selecione pelo menos um tipo de carta",
  };

  String warning = "";

  void showWarningMessage() {
    if (nameController.text.isEmpty &&
        !cardTypes["imagens"]! &&
        !cardTypes["numeros"]!) {
      setState(() {
        warning = warningTypes["no-name-and-no-tipo-carta"]!;
      });
    } else if (nameController.text.isEmpty) {
      setState(() {
        warning = warningTypes["no-name"]!;
      });
    } else if (!cardTypes["imagens"]! && !cardTypes["numeros"]!) {
      setState(() {
        warning = warningTypes["no-tipo-carta"]!;
      });
    } else {
      setState(() {
        warning = warningTypes["none"]!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const Navbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: const Header1(
              text: "Jogo da Memória",
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Header2(
                        text: "Nome",
                      ),
                      InputField(
                        hintText: "Digite seu nome",
                        textController: nameController,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Header2(
                        text: "Tipos de cartas",
                      ),
                      CheckboxField(
                        labelText: "Imagens",
                        onChecked: (value) {
                          setState(
                            () {
                              cardTypes["imagens"] = value;
                            },
                          );
                        },
                      ),
                      CheckboxField(
                        labelText: "Números",
                        onChecked: (value) {
                          setState(
                            () {
                              cardTypes["numeros"] = value;
                            },
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Text(
              warning,
              style: const TextStyle(
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Button(
              text: "Jogar",
              onPressed: showWarningMessage,
            ),
          ),
        ],
      ),
    );
  }
}
