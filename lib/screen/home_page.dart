import 'package:admin/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 4),() => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(),)));
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:SpinKitSpinningLines(
          color: Colors.green,
          lineWidth: 4,
        )
      ),
    );
  }
}

