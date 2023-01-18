import 'package:flutter/material.dart';
import 'package:movie_web_app/features/home_page/pages/home_page.dart';
import 'package:movie_web_app/service/data_sources.dart';
import 'package:movie_web_app/shared/colors.dart';

class LoginOrSignUpPage extends StatefulWidget {
  const LoginOrSignUpPage({super.key});

  @override
  State<LoginOrSignUpPage> createState() => _LoginOrSignUpPageState();
}

class _LoginOrSignUpPageState extends State<LoginOrSignUpPage> {
  bool passwordHidden = true;
  bool newLogin = false;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset('assets/images/login_background.png',
            width: double.infinity, fit: BoxFit.fitWidth),
        Positioned(
            bottom: -90,
            left: 0,
            right: 0,
            child: Image.asset('assets/images/vector.png',
                width: double.infinity, fit: BoxFit.fitWidth)),
        Positioned(
            top: 45,
            right: 60,
            child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20)),
                width: 166,
                height: 58,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (() {
                          setState(() {
                            newLogin = !newLogin;
                          });
                        }),
                        child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: newLogin
                                    ? AppColors.primary
                                    : AppColors.secondary),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text('Login',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: newLogin ? 15 : 28,
                                        color: newLogin
                                            ? AppColors.white.withOpacity(0.7)
                                            : AppColors.white)),
                              ),
                            )),
                      ),
                      InkWell(
                        onTap: (() {
                          setState(() {
                            newLogin = !newLogin;
                          });
                        }),
                        child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: newLogin
                                    ? AppColors.secondary
                                    : AppColors.primary),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Center(
                                child: Text('Sign up',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: newLogin ? 28 : 15,
                                        color: !newLogin
                                            ? AppColors.white.withOpacity(0.7)
                                            : AppColors.white)),
                              ),
                            )),
                      )
                    ]))),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 120),
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.grey,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(1.0, 1.0),
                        blurRadius: 1.0)
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Image.asset('assets/images/popcorn.png',
                            height: 120),
                      ),
                      Text(newLogin ? 'Welcome !' : 'Welcome back',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                              color: AppColors.white)),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 580,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: TextField(
                              controller: userNameController,
                              style: const TextStyle(color: AppColors.white),
                              decoration: InputDecoration(
                                  labelText: 'Enter here your username',
                                  labelStyle: const TextStyle(
                                      color: AppColors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                  hintText: 'my_username',
                                  hintStyle: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontStyle: FontStyle.italic),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      borderSide: const BorderSide(
                                          width: 2, color: Colors.white)))),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 580,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: TextField(
                              controller: passwordController,
                              obscureText: passwordHidden,
                              obscuringCharacter: '*',
                              style: const TextStyle(color: AppColors.white),
                              decoration: InputDecoration(
                                labelText: 'Enter here your password',
                                labelStyle: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                                hintText: 'my_password',
                                hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontStyle: FontStyle.italic),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: const BorderSide(
                                        width: 2, color: Colors.white)),
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 4),
                                  child: IconButton(
                                    color: AppColors.white,
                                    icon: passwordHidden == true
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility),
                                    onPressed: () {
                                      setState(() {
                                        passwordHidden = !passwordHidden;
                                      });
                                    },
                                  ),
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(height: 20),
                      InkWell(
                          onTap: () {
                            if (newLogin) {
                              bool auth = false;
                              DataSources.signUp(userNameController.text,
                                      passwordController.text)
                                  .then((result) {
                                setState(() {
                                  auth = result;
                                });
                              });
                              if (auth) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const HomePage())));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Happy to have you!")));
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) =>
                                        const LoginOrSignUpPage())));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Error try again!")));
                              }
                            } else {
                              bool auth = false;
                              DataSources.login(userNameController.text,
                                      passwordController.text)
                                  .then((result) {
                                setState(() {
                                  auth = result;
                                });
                              });
                              if (auth) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) => const HomePage())));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text("Glad to see you back!")));
                              } else {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: ((context) =>
                                        const LoginOrSignUpPage())));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Error try again!")));
                              }
                            }
                          },
                          child: Container(
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.secondary),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text('Next',
                                      style: TextStyle(
                                          color: AppColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                  Icon(Icons.arrow_forward_ios,
                                      color: AppColors.white, size: 16)
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            )),
      ]),
    );
  }
}
