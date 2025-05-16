import 'package:flutter/material.dart';

Widget melasWidget({required String id,required String name,required String image}){
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Column(
      children: [
        Container(
          height: 150,
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
            border: Border.all(color: Colors.black,width: 1.5),
            image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover,)
          ),
        ),
        Container(
          height: 40,
          width: 200,
          decoration: BoxDecoration(color: Colors.amber,
           border: Border.all(color: Colors.black,width: 1.5),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))),
          child: Center(child: Text(name,style: TextStyle(fontWeight: FontWeight.bold),)))
      ],
    ),
  );

}