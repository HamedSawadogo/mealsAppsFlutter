import 'package:flutter/material.dart';
import 'package:recipes/model/User.dart';
import 'package:recipes/utils/constants.dart';
import 'package:recipes/widgets/EmailInputForm.dart';
import 'package:recipes/widgets/FormInputItem.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _password.dispose();
    _email.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 280,
            width: double.infinity,
            child: Image.network(
                "https://i0.wp.com/post.healthline.com/wp-content/uploads/2022/11/2602810-13-Best-Prepared-Meal-Delivery-Services-of-2022-Header-81b9bf.jpg?w=1155&h=1528",
                fit: BoxFit.cover),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Inscription",
                  style: formStyle,
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.account_circle_outlined,
                  size: 33,
                  color: appColor,
                )
              ],
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                FormInputItem(
                    text: "username",
                    hinText: "nom d'utilisateur",
                    formController: _username,
                    type: FormType.username
                ),
               EmailInputForm(
                   formController:_email, text: "email", hinText: "email"),
                FormInputItem(
                    text: "password",
                    hinText: "mot de passe",
                    formController: _password,
                    type: FormType.password
                ),
                ///button
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(10)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            backgroundColor:
                                MaterialStateProperty.all(appColor),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {}
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => const HomePage(),
                            // ));
                            setState(() {
                              _email.text="";
                              _password.text="";
                              _username.text="";
                            });
                            final user=User(email:
                                _email.text,
                                password: _password.text,
                                username: _username.text);
                            print(user.toString());
                          },
                          label: const Text(
                            "inscrivez vous",
                            style: title,
                          ),
                          icon: const Icon(
                            Icons.login,
                            size: 28,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
