import 'package:flutter/material.dart';

//pages
import './about.dart';
import './main.dart';


class HomePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EaseCare"),
        flexibleSpace: Image.asset("assets/med2.jpg",
          fit: BoxFit.cover,),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: Text('Hashan Dilhara'),
                accountEmail: Text('dilharahashan1996@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://www.pngarts.com/files/3/Avatar-PNG-Download-Image.png'),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://st4.depositphotos.com/36924814/41459/i/450/depositphotos_414593596-stock-photo-medical-health-red-cross-pattern.jpg'
                    ),
                    fit: BoxFit.cover,
                  ),
                )
            ),

            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => AboutPage())
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sign Out'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => Welcome())
                );
              },
            ),


          ],
        ),
      ),
      body: Column(

      ),
    );



  }
}