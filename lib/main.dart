import 'package:flutter/material.dart';
import 'package:devfolio/screens/Welcome/welcome_screen.dart';
import 'package:devfolio/constants.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: bgColor,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: primaryColor,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: secondaryColor,
            iconColor: bodyTextColor,
            prefixIconColor: bodyTextColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home: const WelcomeScreen(),
    );
  }
}
/*final routes = {
    '/home' : (context) => HomePage(),
    '/Inscription' : (context) => InscriptionPage(),
    '/Authentification' : (context) => AuthentificationPage(),
    '/meteo' : (context) => MeteoPage(),
    '/gallerie' : (context) => GalleriePage(),
    '/pays' : (context) => PaysPage(),
    '/contact' : (context) => ContactPage(),
    '/parametres' : (context) => ParametresPage(),
  };
  Widget build (BuildContext context){
    return FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (BuildContext context, AsyncSnapshot<SharedPreferences> prefs) {
          var x = prefs.data;
          if (prefs.hasData) {
            bool conn = x?.getBool('connecte') ?? false;
            if (conn)
              // return MaterialApp(home: HomePage());
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: HomePage(),
                routes: routes,
              );
          }
          //return MaterialApp(home: AuthentificationPage());
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AuthentificationPage(),
            routes: routes,
          );

        }
    );
  }
}*/
