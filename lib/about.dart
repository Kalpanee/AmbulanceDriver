import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
        flexibleSpace: Image.asset("assets/med2.jpg",
          fit: BoxFit.cover,),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(3.0),
              child: Text('This is an Ambulance Tracking System where that you can simply see all the ambulances available in your area and book that you wanted. Here you will be able to place appointments for both private ambulance services and Suwaseriya(1990).\n'
                  'You will be able to see the charging rates of each private ambulance service by just a click. Once you made an appointment you are allowed to cancel the booking within 5 minutes by contacting the authorized ambulance personnel. You will be able to track the location of ambulance when it is arriving.\n\n'
                  'Make use of this for the betterment of the society. Stay Safe !\n\n'
                  'Team EaseCare',
              style: TextStyle(fontSize: 16, fontFamily: 'PTSerif'),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/logo.jpg")
                    )
                )
            ),
          ],
        ),
      )


    );
  }
}
