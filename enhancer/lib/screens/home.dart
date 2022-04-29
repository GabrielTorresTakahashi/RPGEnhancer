import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Theme.of(context).backgroundColor, //scaffold color
      body: Column(
        
        children: [
          Container(color: Colors.blue,),
          Container(color: Colors.red,)
        ],
      )
      );
  }
}
