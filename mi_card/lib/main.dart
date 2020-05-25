import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius:50.0,
                  backgroundImage: AssetImage('lib/images/image2.jpg'),
                ),
                Text(
                  'Vaibhav Agrawal',
                  style:TextStyle(
                    fontSize: 40.0,
                    color:Colors.white,
                    fontWeight: FontWeight.bold
                  )
                ),
                Text(
                  'Developer',
                  style:TextStyle(
                    fontSize: 30.0,
                    color:Colors.teal.shade100,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.5
                  )
                ),
                SizedBox(
                  height: 20.0,
                  width:150.0,
                  child: Divider(
                    color: Colors.teal.shade100,
                  ),
                ),
                Card(
                  color:Colors.white,
                  margin: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 25.0),
                  child : Padding(
                    padding: EdgeInsets.all(10.0),
                    child:ListTile(
                      leading: Icon(
                        Icons.phone,
                        color:Colors.teal,
                      ),
                      title:Text("+917748008837",
                        style : TextStyle(
                            color:Colors.teal.shade900,
                            fontSize: 20.0
                        ),
                  )
                ),
                ),
                ),
                Card(
                  color: Colors.white,
                  margin:EdgeInsets.symmetric(vertical:10.0 , horizontal: 25.0 ),
                  child:Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.email,
                        color:Colors.teal,
                      ),
                      title: Text(
                          "vaibhav.brkn@gmail.com",
                          style:TextStyle(
                              fontSize: 20.0,
                              color:Colors.teal.shade900
                          )
                      ),
                    )
                  ),
                ),

                ],
            )
          )
          ),
        )
      );
  }
}

