import 'package:flutter/material.dart';
import '../controller/amistad_controller.dart';

// Átomo: etiqueta
class Label extends StatelessWidget {
  final String text;

  const Label(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}

// Átomo: campo numérico
class NumberField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const NumberField({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }
}

// Átomo: botón principal
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}

// Átomo: resultado
class ResultText extends StatelessWidget {
  final String text;

  const ResultText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18),
      textAlign: TextAlign.center,
    );
  }
}

// Molécula: input de dos números
class NumerosInput extends StatelessWidget {
  final TextEditingController aController;
  final TextEditingController bController;

  const NumerosInput({super.key, required this.aController, required this.bController,});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: NumberField(
            controller: aController,
            hint: 'Número a',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: NumberField(
            controller: bController,
            hint: 'Número b',
          ),
        ),
      ],
    );
  }
}

// Organismo: tarjeta principal
class AmigosCard extends StatefulWidget {
  const AmigosCard({super.key});

  @override
  State<AmigosCard> createState() => _AmigosCardState();
}

class _AmigosCardState extends State<AmigosCard> {
  final TextEditingController _ctrlA = TextEditingController();
  final TextEditingController _ctrlB = TextEditingController();
  final AmistadController _controller = AmistadController();
  String _resultado = '';

  void _verificarAmistad() {
    setState(() {
      _resultado = _controller.verificarAmigos(
        _ctrlA.text,
        _ctrlB.text,
      );
    });
  }

  @override
  void dispose() {
    _ctrlA.dispose();
    _ctrlB.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Label('Verificador de números amigos'),
            const SizedBox(height: 16),
            NumerosInput(
              aController: _ctrlA,
              bController: _ctrlB,
            ),
            const SizedBox(height: 16),
            PrimaryButton(
              text: 'Verificar',
              onPressed: _verificarAmistad,
            ),
            const SizedBox(height: 16),
            ResultText(_resultado),
          ],
        ),
      ),
    );
  }
}

// Página
class AmigosPage extends StatelessWidget {
  const AmigosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Números amigos'),
        backgroundColor: Colors.greenAccent,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: AmigosCard(),
      ),
    );
  }
}