import 'package:flutter/material.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import 'package:devfolio/screens/Login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;
TextEditingController txt_login = new TextEditingController();
TextEditingController txt_password = new TextEditingController();

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: txt_login,
            style: TextStyle(color: bodyTextColor),
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: primaryColor,
            onSaved: (email) {},
            decoration: InputDecoration(
              hintText: "Votre email",
              hintStyle: TextStyle(color: bodyTextColor),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: txt_password,
              style: TextStyle(color: bodyTextColor),
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: primaryColor,
              decoration: InputDecoration(
                hintText: "Votre mot de passe",
                hintStyle: TextStyle(color: bodyTextColor),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              _onInscrire(context);
            },
            child: Text("S'inscrire".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  Future<void> _onInscrire(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    if (!txt_login.text.isEmpty && !txt_password.text.isEmpty) {
      prefs.setString("login",txt_login.text);
      prefs.setString("password",txt_password.text);
      prefs.setBool("connecte", true);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(
          builder: (context) {
        return LoginScreen();
    },
    ),
      );
    }     else {
      const snackBar = SnackBar(
          content: Text('Email ou mot de passe vide')
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}