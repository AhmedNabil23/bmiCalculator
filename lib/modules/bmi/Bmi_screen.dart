import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/bmi_result/bmi_result_screen.dart';


class  BmiScreen extends StatefulWidget{
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale=true;
  //for slider
  double height=120;

  int weight=40;
  int age=18;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body:
      Column(
        children: [
          Expanded(child:
              //عملت كل الrow ف بادنج
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
             children: [
               Expanded(
                 child: GestureDetector(
                   onTap: ()
                   {
                     setState(() {
                       isMale=true;
                     });
                   },
                   child: Container(

                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        Image(
                            image: AssetImage("assets/images/male.png"),
                            height: 90,
                        ),
                         SizedBox(height: 15,),
                         Text(
                           "Male",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                         ),
                       ],
                     ),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color: isMale?Colors.blue:Colors.grey[400],
                     ),
                   ),
                 ),
               ),
               SizedBox(width: 20,),
               Expanded(
                 child: GestureDetector(
                   onTap: ()
                   {
                     setState(() {
                       isMale=false;
                     });
                   },
                   child: Container(

                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Image(
                           image: AssetImage("assets/images/female.png"),
                           height: 90,
                         ),

                         SizedBox(height: 15,),
                         Text(
                           "Female",
                           style: TextStyle(
                             fontSize: 20,
                             fontWeight: FontWeight.bold,
                           ),
                         ),
                       ],
                     ),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       color:isMale?Colors.grey[400]:Colors.blue,
                     ),
                   ),
                 ),
               ),
             ],
            ),
          )),

//الجزء الثاني
          Expanded(child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
               children: [
               Text(
               "HEIGHT",
                style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                ),

               ),
                Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   //عشان موقع الcm
                   crossAxisAlignment: CrossAxisAlignment.baseline,
                   textBaseline: TextBaseline.alphabetic,
                   children: [
                     Text(
                       "${height.round()}",
                       style: TextStyle(
                         fontSize: 40,
                         fontWeight: FontWeight.w900,
                       ),

                     ),
                     SizedBox(width: 5,),
                     Text(
                       "cm",
                       style: TextStyle(
                         fontSize: 15,
                         fontWeight: FontWeight.bold,
                       ),

                     ),


                   ],
                 ),
                 Slider(
                     value: height,
                     max: 220.0,
                     min: 80,
                     onChanged:(value){
                       setState(() {
                         height=value;
                       });
                     },)

               ],
              ),
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[400],
              ),
            ),
          )),

//الجزء الثالث
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: Row(
             children: [
               Expanded(
                 child: Container(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,

                     children: [
                       Text(
                         "Weight",
                         style: TextStyle(
                           fontSize: 30,
                           fontWeight: FontWeight.bold,
                         ),

                       ),
                       Text(
                         "$weight",
                         style: TextStyle(
                           fontSize: 40,
                           fontWeight: FontWeight.w900,
                         ),

                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           FloatingActionButton(onPressed: (){
                             setState(() {
                               weight--;
                             });
                           },
                             child: Icon(Icons.remove) ,
                             mini: true,

                           ),
                           SizedBox(width: 20,),
                           FloatingActionButton(onPressed: (){

                             setState(() {
                               weight++;
                             });
                           },
                             child: Icon(Icons.add) ,
                             mini: true,

                           ),

                         ],
                       ),

                     ],
                   ),
                  decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: Colors.grey[400],
                   ),


                 ),
               ),
               SizedBox(width: 20,),
               Expanded(
                 child: Container(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,

                     children: [
                       Text(
                         "Age",
                         style: TextStyle(
                           fontSize: 30,
                           fontWeight: FontWeight.bold,
                         ),

                       ),
                       Text(
                         "$age",
                         style: TextStyle(
                           fontSize: 40,
                           fontWeight: FontWeight.w900,
                         ),

                       ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           FloatingActionButton(onPressed: (){
                             setState(() {
                               age--;
                             });
                           },
                             child: Icon(Icons.remove) ,
                             mini: true,

                           ),
                           SizedBox(width: 20,),
                           FloatingActionButton(onPressed: (){
                             setState(() {
                               age++;
                             });
                           },
                             child: Icon(Icons.add) ,
                             mini: true,

                           ),

                         ],
                       ),

                     ],
                   ),
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: Colors.grey[400],
                   ),


                 ),
               ),

             ],
           ),
         ),



//الزرار
        Container(
          width: double.infinity,
          color: Colors.blue,
          child: MaterialButton(onPressed: (  ){

            double result=weight/pow(height/100, 2);
            print(result.round());

            //عشان اروح للاسكرينة التانية
            Navigator.push(context,
                MaterialPageRoute(builder:(context)=>BMIResultScreen(
                  //ببعت ف الكنستراكتور القيم اللي عندي عشان يحطهم في اللي عندة ويعرضهم
                  isMale: isMale,
                  result: result.round(),
                  age:age,

                ))
            );
          },
            height: 50,
            child:Text("CALCULATE",
            style: TextStyle(
              color: Colors.white,
            ) ,),
      ),
        ),
    ])
   );
  }
}
