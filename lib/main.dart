import "package:device_preview/device_preview.dart";
import "package:flutter/material.dart";
import "package:app_de_compras/telas/tela_de_login.dart";

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const RunApp(),
    ),
  );
}

class RunApp extends StatelessWidget {
  const RunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
    );
  }
}
