import 'package:flutter/material.dart';
import 'package:new_provider_code/new_provider/api.dart';
import 'package:new_provider_code/new_provider/screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>Melasprovider())
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CategoryScreen(),
      ),
    );
  }
}