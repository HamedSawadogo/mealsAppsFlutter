import 'package:flutter/material.dart';
enum FormType { login, password, username, email }

class FormInputItem extends StatefulWidget {
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
  State<FormInputItem> createState() => _FormInputItemState();
}

class _FormInputItemState extends State<FormInputItem> {
  bool _obscureText=true;
  @override
  Widget build(BuildContext context) {
     void setVisibility(){
       setState(() {
         _obscureText=!_obscureText;
       });
     }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.formController,
        obscureText:widget.type==FormType.password?_obscureText:false,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "veillez bien renseigner ce champ";
          }
          return null;
        },
        decoration:widget.type==FormType.password?
            InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child:_obscureText? IconButton(
                onPressed: () {
                  setVisibility();
                },
                icon:const Icon(Icons.visibility_off),
              ):IconButton(
                onPressed: () {
                  setVisibility();
                },
                icon:const Icon(Icons.visibility),
              ),
            ),
            fillColor: Colors.deepOrange,
            label: Text(widget.text),
            hintText: widget.hinText,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)))
            ):InputDecoration(
            prefixIcon: const Icon(Icons.person),
            fillColor: Colors.deepOrange,
            label: Text(widget.text),
            hintText: widget.hinText,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)))
        ),
      ),
    );
  }
}
