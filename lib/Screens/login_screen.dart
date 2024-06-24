import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_screen/Screens/sign_up.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 114, 188, 248),
          title: Text(
            "Login screen",
          ),
        ),
        body:
            //  : Color.fromARGB(255, 146, 187, 220),
            Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "login Page",
              style: TextStyle(fontSize: 35, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Form(
              child: Column(
                children: [
                  Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: const InputDecoration(
                              labelText: "Email",
                              // helperText: "enter email: e.g. xyz12@gmail.com",
                              hintText: "enter your email",
                              prefixIcon: Icon(Icons.email),
                            ),
                            onChanged: (String value) {},
                            validator: (value) {
                              return value!.isEmpty
                                  ? 'please enter E-mail'
                                  : null;
                            },
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: passController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              labelText: "Password",
                              hintText: "enter your password",
                              prefixIcon: Icon(Icons.lock_open_rounded),
                              suffixIcon: Icon(Icons.remove_red_eye_outlined),
                            ),
                            onChanged: (String value) {},
                            validator: (value) {
                              return value!.isEmpty
                                  ? 'please enter password'
                                  : null;
                            },
                          ),
                          const SizedBox(height: 50),
                        ],
                      )),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    FloatingActionButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {}
                      },
                      child: Text("LOGIN"),
                      splashColor: Color.fromARGB(255, 114, 188, 248),
                    ),
                  ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("dont have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ));
                          },
                          child: Text("SignUp"))
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
