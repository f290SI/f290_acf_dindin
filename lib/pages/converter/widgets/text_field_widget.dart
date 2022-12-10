import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.icon,
      required this.hint,
      required this.callBack,
      required this.controller,
      this.habilitado = false});

  final IconData icon;
  final String hint;
  final Function(String) callBack;
  final TextEditingController controller;
  final bool habilitado;

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).colorScheme.secondary;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextField(
        enabled: habilitado,
        controller: controller,
        onChanged: callBack,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          fillColor: Colors.white60,
          labelText: hint,
          labelStyle: TextStyle(color: color),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: color),
            borderRadius: BorderRadius.circular(32),
          ),
          prefixIcon: Icon(
            icon,
            color: color,
          ),
        ),
      ),
    );
  }
}
