import 'package:flutter/material.dart';
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
                  style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.account_circle_outlined,
                  size: 33,
                  color: Colors.deepOrange,
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
                    type: FormType.username),
                FormInputItem(
                    text: "email",
                    hinText: "votre email",
                    formController: _email,
                    type: FormType.email),
                FormInputItem(
                    text: "password",
                    hinText: "mot de passe",
                    formController: _password,
                    type: FormType.password),

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
                                MaterialStateProperty.all(Colors.deepOrange),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {}
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) => const HomePage(),
                            // ));
                          },
                          label: const Text(
                            "inscrivez vous",
                            style: TextStyle(fontSize: 19),
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
