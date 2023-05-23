import 'package:flutter/material.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../../constants.dart';
import '../../Signup/signup_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:devfolio/screens/home/home_screen.dart';

late SharedPreferences prefs;
TextEditingController txt_login = new TextEditingController();
TextEditingController txt_password = new TextEditingController();

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key,}) : super(key: key);

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
          const SizedBox(height: defaultPadding),
          Hero(
            tag: "login_btn",
            child: ElevatedButton(
              onPressed: () {
                _onAuthentifier(context);
              },
              child: Text(
                "Connexion".toUpperCase(),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
  Future<void> _onAuthentifier(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    String log = prefs.getString("login") ?? '';
    String psw = prefs.getString("password") ?? '';

    print(txt_password.text);
    if (txt_login.text == log && txt_password.text == psw) {
      prefs.setBool("connecte", true);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return HomeScreen();
        },
      ),
      );
    } else {
      const snackBar=SnackBar(
        content: Text('Vérifier votre email et mot de passe'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
//ameni.benrbiha14@gmail.com
}
