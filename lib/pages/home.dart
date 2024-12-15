import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/employee.dart';

class Home extends StatefulWidget{
const Home({super.key});
@override
State<Home>createState()=> _HomeState();

}
 class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed:(){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>Employee()));
      },child: Icon(Icons.add),),
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
       Text("Flutter", style: TextStyle(color: Colors.blue,fontSize:20.0,fontWeight:FontWeight.bold)),
       Text("Firebase", style: TextStyle(color: Colors.orange,fontSize:24.0,fontWeight:FontWeight.bold))
          ],)),
      body: Container(
        child: Column(children: [
        
        ],),
      ),
    );
  }
 }