import 'package:flutter/material.dart';
import 'package:pf_app/core/config/config.dart';

import '../../../components/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;

  handleSubmit() async {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: XColors.dark,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: double.infinity,
        height: double.infinity,
        child: Row(
          children: [
            Expanded(
                child: Image(
              image: const AssetImage("assets/images/login.png"),
              width: MediaQuery.of(context).size.width * 0.5,
              fit: BoxFit.contain,
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage(
                      "assets/images/logo.png",
                    ),
                    width: 150,
                  ),
                  Text('LOGIN',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 8),
                  Text('Enter your credentials to continue',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.grey,
                          )),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Form(
                        child: Column(
                      children: [
                        TextFormField(
                            decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                          filled: true,
                          fillColor: XColors.primary.withOpacity(0.1),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 0),
                          ),
                        )),
                        const SizedBox(height: 16),
                        TextFormField(
                            decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white.withOpacity(0.5),
                                  ),
                          filled: true,
                          fillColor: XColors.primary.withOpacity(0.1),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(18),
                            ),
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 0),
                          ),
                        )),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 52,
                          child: XButton(
                              onPressed: handleSubmit,
                              text: 'LOGIN',
                              loading: loading),
                        ),
                      ],
                    )),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
