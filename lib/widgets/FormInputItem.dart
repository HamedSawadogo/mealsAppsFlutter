import 'package:flutter/material.dart';

enum FormType { login, password, username, email }

class FormInputItem extends StatelessWidget {
  const FormInputItem(
      {super.key,
      required this.text,
      required this.hinText,
      required this.formController,
      required this.type});
  final String text;
  final String hinText;
  final TextEditingController formController;
  final FormType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: formController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "veillez bien renseigner ce champ";
          }
          return null;
        },
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.password),
            fillColor: Colors.deepOrange,
            label: Text(text),
            hintText: hinText,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)))),
      ),
    );
  }
}
