import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes/pages/HomePage.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  TextEditingController _userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                    "https://www.healthyalternative.ca/wp-content/uploads/2015/06/meal-plan-bg.jpg",
                    fit: BoxFit.fill)),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Decouvrez vos plats preférés",
                style: GoogleFonts.abhayaLibre(fontSize: 28),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _userNameController,
                decoration: InputDecoration(
                    hintText: "Username",
                    label: Text("Username"),
                    suffixIcon: Icon(Icons.login),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    print(_userNameController.text);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          HomePage(username: _userNameController.text),
                    ));
                  },
                  child: Text(
                    "Se connecter",
                    style: GoogleFonts.aBeeZee(fontSize: 20),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
