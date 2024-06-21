import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget{

  @override
  State<MyHomePage>createState() {
    return MyHomePageState();
  }
}


class MyHomePageState extends State<MyHomePage>{
  var result = "";
  var W = TextEditingController();
  var F = TextEditingController();
  var I = TextEditingController();
  double iC = 0;
  double height = 0;
  double bmi = 0;

  Color bColor  =Colors.blue.shade100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI APP",style: TextStyle(fontSize: 28,fontWeight:FontWeight.w500),),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        height:  double.infinity,
        width: double.infinity,
        color: bColor,
        child: Column(
         children: [

           Text("BMI",style: TextStyle(fontSize: 60,fontWeight: FontWeight.w700,color: Colors.deepPurpleAccent,fontFamily: "georgias"),),

           SizedBox(height: 30),


                   Container(
                     width: 300,
                     child: TextField(
                       controller: W,
                       keyboardType: TextInputType.number,
                       style: TextStyle(fontSize: 30),
                         decoration: InputDecoration(
                           prefixIcon: Icon(Icons.line_weight),
                       hintText:"Enter Weight in Kg",
                       hintStyle: TextStyle(fontSize: 30),)
                     ),
                   ),

          Container(
            width: 300,
            child: TextField(
              style: TextStyle(fontSize: 30),
              controller: F,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.height,size: 36,),
                  hintText: "Enter Height in Feet",hintStyle: TextStyle(fontSize: 30)
              ),
            ),
          ),
           Container(
             width: 300,
             child: TextField(
               style: TextStyle(fontSize: 30),
               controller: I,
               keyboardType: TextInputType.number,
               decoration: InputDecoration(
                   prefixIcon: Icon(Icons.height,size: 36,),
                   hintText: "Enter Height in Inches",hintStyle: TextStyle(fontSize: 30)
               ),
             ),
           ),
           SizedBox(height: 30,),
           Container(
             height: 50,
             width: 150,
             child: ElevatedButton(
                 style: ElevatedButton.styleFrom(elevation: 10,),

                 onPressed: (){
                   if(W.text.isNotEmpty && F.text.isNotEmpty && I.text.isNotEmpty){
                     var  iW = double.parse(W.text);
                     var iF = double.parse(F.text);
                     var iI = double.parse(I.text);
                     iC = iI + 12*iF;
                     height = iC*0.0254;

                     bmi = iW/pow(height,2);


                     setState(() {
                       if(bmi <18.5){result = "You are Under Weight";   bColor = Colors.orangeAccent;}
                       else if(bmi>=18.5&&bmi<25){result = "You are Healthy"; bColor = Colors.greenAccent;}
                       else if(bmi>25&&bmi<=30){result= "You are OverWeight"; bColor = Colors.redAccent;}
                       else if (bmi>30){result = "You are Obese"; bColor = Colors.red;}

                     });


                   }
                   else{
                     setState(() {
                       result = "Please fill all the required elements";
                       bmi = 0;
                     });
                   }

                 }, child: Text("Check BMI",style: TextStyle(fontSize: 20),)),
           ),

           SizedBox(height: 20,),

           Center(child: Text("Your BMI is ${bmi.toStringAsFixed(2)} $result",style: TextStyle(fontSize: 20),))
               ],
             ),
        ),);
  }
}