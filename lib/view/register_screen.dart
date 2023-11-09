import 'package:flutter/material.dart';
import 'package:contact_number_app/provider/contact_provider.dart';
import 'package:contact_number_app/utils/share_helper.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  ContactProvider? providerW;
  ContactProvider? providerR;
  TextEditingController txtemail = TextEditingController();
  TextEditingController txtpass = TextEditingController();

  bool validateEmail(String email) {
    return RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  bool validatePassword(String password) {
    return password.length >= 6;
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<ContactProvider>();
    providerR = context.read<ContactProvider>();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.30,
                    width: MediaQuery.of(context).size.width * 0.30,
                    child: const Image(
                      image: AssetImage("assets/img/register.png"),
                    ),
                  ),
                  const Text(
                    "Register",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Email",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  TextField(
                    controller: txtemail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        filled: true),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Password",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  TextField(
                    controller: txtpass,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        filled: true),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      String email = txtemail.text;
                      String password = txtpass.text;

                      if (validateEmail(email) && validatePassword(password)) {
                        ShareHelper shr = ShareHelper();
                        shr.setRegister(email, password);
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Registration success!",
                              style: TextStyle(color: Colors.yellow),
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Invalid email or password!",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text("Register"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
