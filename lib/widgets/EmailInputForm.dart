import 'package:flutter/material.dart';

class EmailInputForm extends StatefulWidget {
  final TextEditingController formController;
  final String text;
  final String hinText;

  const EmailInputForm({Key? key,
    required this.formController,
    required this.text,required this.hinText}) : super(key: key);

  @override
  State<EmailInputForm> createState() => _EmailInputFormState();
}

class _EmailInputFormState extends State<EmailInputForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.formController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "veillez bien renseigner votre email";
          }
          return null;
        },
        decoration:InputDecoration(
            prefixIcon: const Icon(Icons.email),
            suffixIcon:const Padding(
              padding:  EdgeInsets.all(8.0),
            ),
            fillColor: Colors.deepOrange,
            label: Text(widget.text),
            hintText: widget.hinText,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
            )
        ),
      )
    );
  }
}
