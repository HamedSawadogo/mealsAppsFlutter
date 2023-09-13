import 'package:flutter/material.dart';
import 'package:recipes/pages/HomePage.dart';
import 'package:recipes/pages/Register.dart';
import 'package:recipes/utils/constants.dart';
import '../widgets/FormInputItem.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _username.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///form key
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
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
                  "Connectez vous",
                  style: formStyle,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.account_circle,
                  size: 36,
                  color: appColor,
                )
              ],
            ),
          ),
          Form(
              key: formKey,
              child: Column(
                children: [
                  FormInputItem(
                    text: "nom d'utilisateur",
                    hinText: "username",
                    formController: _username,
                    type: FormType.login,
                  ),
                  FormInputItem(
                    text: "mot de passe",
                    hinText: "password",
                    formController: _password,
                    type: FormType.password,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: ElevatedButton.icon(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(10)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            backgroundColor:
                                MaterialStateProperty.all(appColor),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                          },
                          label: const Text(
                            "Se connecter",
                            style: title,
                          ),
                          icon: const Icon(
                            Icons.login,
                            size: 28,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "vous n'avez pas de compte ?",
                        style: title,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const RegistrationPage(),
                            ));
                          },
                          child: const Text("creer un compte", style: title))
                    ],
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
