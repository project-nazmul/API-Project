import 'dart:convert';
import 'package:admin/screen/bottom_nav/bottom_nav.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:admin/api_service/custom_api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
   
    isLogin();
    super.initState();
  }

  isLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString("token") != null) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => BottomNavPage()));
    }
  }

  getLogin() async {
    try {
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      setState(() {
        isLoading = true;
      });
      final result = await CustomeHttp.login(emailController.text, passwordController.text);
      setState(() {
        isLoading = false;
      });
      final data = jsonDecode(result);
      if (data["access_token"] != null) {
        setState(() {
          sharedPreferences.setString("token", data["access_token"]);
          sharedPreferences.setString("email", emailController.text);
        });
        print(data["access_token"]);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNavPage()));
      }

    } catch (e) {
      print("$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        //dismissible: false,
        blur: 10,
        opacity: 0.5,

        progressIndicator: SpinKitSpinningLines(
          color: Colors.green,
          lineWidth: 4,
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(22),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter your Email and Password",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.green, width: 2)),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.green,
                      ),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.green, width: 2)),
                      label: Text("Email"),
                      labelStyle: TextStyle(color: Colors.green),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.green, width: 2)))),
              SizedBox(height: 10,),
              TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.green, width: 2)),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.green,
                      ),
                      enabled: true,
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.green, width: 2)),
                      label: Text("Password"),
                      labelStyle: TextStyle(color: Colors.green),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.green, width: 2)))),
              SizedBox(height: 10,),
              ElevatedButton(
                  onPressed: () {
                    getLogin();
                  },
                  style: const ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(Colors.green)),
                  child: Text("Submit",style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),))
            ],
          ),
        ),
      ),
    );
  }
}
