import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapBottomPill extends StatelessWidget{
  const MapBottomPill({
    Key? key,
}) : super(key: key);

  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset.zero
            )
          ]
      ),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipOval(
                      child: Image.asset('assets/nawaloka.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover
                      ),
                    )
                  ],
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nawaloka Service',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 15
                        ),
                      ),
                      Text('Rs.7000 within 10 Kms',
                        style: TextStyle(
                            color: Colors.black54
                        ),
                      ),
                      Text('Rs.150 for extra one Km',
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    MaterialButton(
                      onPressed:(){},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        side: BorderSide(color: Colors.redAccent),
                      ),
                      child: Text(
                        'Book',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}