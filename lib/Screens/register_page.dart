import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenSize.height,
          width: screenSize.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFFc9d6ff),
              Color(0XFFe2e2e2),
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: screenSize.width * 0.0833),
                child: Text(
                  "Sign Up,",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF47037C),
                      fontSize: 32),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: screenSize.width * 0.0833),
                child: Text(
                  "Enter your details below",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.8),
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.025,
              ),
              Center(
                child: MaterialButton(
                  height: screenSize.height * 0.06875,
                  minWidth: screenSize.width * 0.833,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  color: Color(0xFF47037C),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
