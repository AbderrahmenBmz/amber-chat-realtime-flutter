import 'package:chatapp/components/rounded_bottun.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  Widget _buildTextField(
      String routeName, String pageName, Color matColor, Color textColor) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: matColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            //Go to login screen.
            Navigator.pushNamed(context, routeName);
          },
          minWidth: 250.0,
          height: 42.0,
          child: Text(
            pageName,
            style: TextStyle(
              fontSize: 20,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  @override
  dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    child: Hero(
                      tag: 'amber_logo',
                      child: Container(
                          child: Image.asset('assets/images/amber_logo.png'),
                          height: animation.value * 100),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Amber Chat',
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor),
                  )
                ],
              ),
              SizedBox(
                height: 48.0,
              ),
              RoundedButton(
                title: 'Log In',
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  //Go to login screen.
                  Navigator.pushNamed(context, LoginScreen.id);
                },
              ),
              RoundedButton(
                title: 'Resgister',
                color: Colors.blueAccent,
                onPressed: () {
                  //Go to login screen.
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
