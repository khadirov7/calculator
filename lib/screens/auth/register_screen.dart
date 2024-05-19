import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../view_model/login_view_model.dart';
import '../routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: context.watch<AuthViewModel>().loading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0),
                  child: Image.asset("assets/images/img_1.png"),
                ),
                const SizedBox(
                  height: 17,
                ),
                const Text(
                  "REGISTER",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 25.15,
                    fontFamily: "SF Pro Rounded",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38),
                  child: TextFormField(
                    controller: usernameController,
                    style: const TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person,color: Colors.white,),
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Enter User name'),
                    validator: (value) {
                      if (value!.isEmpty && value.length <= 6) {
                        return "Input email length > 6";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38),
                  child: TextFormField(
                    controller: emailController,
                    style: const TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Enter Email'),
                    validator: (value) {
                      if (value!.isEmpty && value.length <= 6) {
                        return "Input email length > 6";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 14,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 38),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.white),
                    textInputAction: TextInputAction.done,
                    controller: passwordController,
                    decoration: const InputDecoration(
                        fillColor: Colors.white,
                        suffixIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.lock_open_outlined,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'Enter Password'),
                    validator: (value) {
                      if (value!.isEmpty && value.length <= 6) {
                        return "Input password length > 6";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF262626),
                  ),
                  onPressed: () {
                    context.read<AuthViewModel>().registerUser(
                      context,
                      email: emailController.text,
                      password: passwordController.text,
                      username: usernameController.text,
                    );
                  }, child: const Padding(
                  padding:  EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 10
                  ),
                  child:  Text(
                    "REGISTER",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.15,
                      fontFamily: "SF Pro Rounded",
                    ),
                  ),
                ),),
                const SizedBox(
                  height: 20,
                ),
                TextButton(onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteNames.loginRoute,
                  );
                }, child: const Text(
                  "Already have an account? Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: "SF Pro Rounded",
                      fontWeight: FontWeight.w500),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
