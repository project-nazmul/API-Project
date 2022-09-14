import 'package:admin/screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: ()async{
                SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                sharedPreferences.clear();
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(),));
              },
              child: Icon(Icons.logout)
          )
        ],
      ),
    );
  }
}
