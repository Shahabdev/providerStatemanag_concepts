import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanag/Provider/login_provider.dart';
import 'package:provider_statemanag/Screens/login_screen.dart';

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwardController = TextEditingController();
    final provider_log = Provider.of<Login_provider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('login')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'e-mail',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 2)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: passwardController,
            decoration: InputDecoration(
              hintText: 'passward',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 2)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              provider_log.login(emailController.text.toString(),
                  passwardController.text.toString());
            },
            child: Container(
              height: 50,
                width: 170,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(15)

                ),
                child: Center(
                child:provider_log.loading?CircularProgressIndicator(color: Colors.black,): Text('log in'))),
          )
        ],
      ),
    );
  }
}
