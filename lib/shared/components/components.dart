import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget defaultButton({
 double width =double.infinity,
 Color background=Colors.blue,
 double radius =0,
 @required Function function,
 @required String text,
})=>  Container(
  width: double.infinity,

  height: 50,
  child: MaterialButton(

    onPressed:function,
    child:
    Text(
      text.toUpperCase(),
      style:TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  ),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,
  ),
);

Widget defaultFormField({
  @required TextEditingController controller,
   TextInputType type,
  @required Function validate,
   Function onTap,

  @required String label,
  @required IconData prefix,
  bool isPassword=false,
  IconData suffix,
  Function suffixPressed,
})=>  TextFormField(
  controller: controller,
  keyboardType: type,
  onTap:onTap,

  validator: validate,

  decoration: InputDecoration(
    labelText:label,
    prefixIcon: Icon(
        prefix
    ),
    suffixIcon: suffix !=null? IconButton(
      onPressed:suffixPressed ,
      icon: Icon(
            suffix,
        ),
    ):null,
    border: OutlineInputBorder(),
  ),


  obscureText: isPassword,

  );



