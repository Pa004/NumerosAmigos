import 'package:flutter/material.dart';
import 'view/amistad_view.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Números Amigos',
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
        useMaterial3: true,
      ),
      home: const AmigosPage(),
    );
  }
}