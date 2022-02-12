import 'package:flutter/material.dart';
//import 'package:device_preview/device_preview.dart';
//Pages
import './login.dart';
import './signup.dart';




void main() {
  runApp(MyApp(), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //locale: DevicePreview.locale(context), // Add the locale here
      //builder: DevicePreview.appBuilder, // Add the builder here
      title: 'Flutter Demo',
      theme: ThemeData(
        //fontFamily: 'PTSerif' ,
        primarySwatch: Colors.blue,
      ),
      home: Welcome(),
    );
  }
}

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
            height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children:[
              Text("WELCOME",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,

              ),

              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),

              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Logo1.png")
                  )
                ),
        ),
              Column(
                children:[
                  Text("DRIVER PARTNER",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.blue
                    ),

                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Column(
                children: [
                  //Login Button
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),
                    ),
                  ),

                  //SignUpButton
                  SizedBox(height: 20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));

                    },
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18
                      ),
                    ),
                  )
                ],
              )
          ],
        ),
      ),
    ),
    );
  }}




