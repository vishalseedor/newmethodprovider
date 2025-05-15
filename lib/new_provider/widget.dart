import 'package:flutter/material.dart';

Widget melasWidget({required String id,required String name,required String image}){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover,)
      ),
    ),
  );

}