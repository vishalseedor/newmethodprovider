import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as https;
import 'package:new_provider_code/new_provider/model.dart';


class Melasprovider with ChangeNotifier {
  List<MealsModel> _meals = [];
  List<MealsModel> get meals {
    return [..._meals];
  }

  bool _isloading = false;
  bool get isloading {
    return _isloading;
  }

  Future<void> getMelasdata(BuildContext context) async {
    print('Fetching view_meals API');
    _isloading = true;
    final url =  'https://www.themealdb.com/api/json/v1/1/filter.php?a=Canadian';
    try {
      final responce = await https.get(Uri.parse(url)
        );
      List<dynamic> extracteddata = jsonDecode(responce.body)['meals'];
      _meals = extracteddata
          .map((fields) => MealsModel(
              idMeal: fields['idMeal'],
              strMeal: fields['strMeal'],
              strMealThumb: fields['strMealThumb']
              ))
          .toList();
      _isloading = false;
      notifyListeners();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content:Text("Request timeout!! try again!") ));
    }
  }

 
}