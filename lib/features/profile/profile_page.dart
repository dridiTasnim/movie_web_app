import 'package:flutter/material.dart';
import 'package:movie_web_app/models/filters.dart';
import 'package:movie_web_app/models/user_account.dart';
import 'package:movie_web_app/shared/colors.dart';

class ProfilePage extends StatefulWidget {
  final UserAccount user;
  const ProfilePage({super.key, required this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    usernameController.text = widget.user.username;
    languageController.text = widget.user.language ?? '';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D2024),
        elevation: 0,
        title: const Text("Profile",
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w700,
            )),
      ),
      body: Container(
        color: AppColors.primary,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.secondary.withOpacity(0.9),
              radius: 80,
              child: Center(
                child: Text(
                  widget.user.username[0].toUpperCase(),
                  style: const TextStyle(
                      fontSize: 76,
                      color: AppColors.white,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: 580,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                    controller: usernameController,
                    style: const TextStyle(color: AppColors.white),
                    decoration: InputDecoration(
                        labelText: 'Username',
                        labelStyle: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
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
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            SizedBox(
              width: 580,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                    controller: languageController,
                    autofillHints: languagesChoices,
                    style: const TextStyle(color: AppColors.white),
                    decoration: InputDecoration(
                        labelText: 'Language',
                        labelStyle: const TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
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
            const SizedBox(height: 20),
            SizedBox(
              width: 480,
              child: Expanded(
                child: InkWell(
                    onTap: () {
                      widget.user.username = usernameController.text;
                      widget.user.language = languageController.text;
                      // TODO : here update the user username
                      const snackBar = SnackBar(
                        content: Text('Account updated !'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.secondary),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Save',
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(width: 16),
                            Icon(Icons.arrow_forward_ios,
                                color: AppColors.white, size: 16)
                          ],
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
