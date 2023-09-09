import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image.network(
            "https://i0.wp.com/post.healthline.com/wp-content/uploads/2022/11/2602810-13-Best-Prepared-Meal-Delivery-Services-of-2022-Header-81b9bf.jpg?w=1155&h=1528"),
        Form(
            child: Column(
          children: [
            TextFormField(),
            TextFormField(),
            ElevatedButton(onPressed: () {}, child: Text("Se connceter"))
          ],
        ))
      ]),
    );
  }
}
