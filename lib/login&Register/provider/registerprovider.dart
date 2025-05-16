import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:new_provider_code/new_provider/screen.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> userlogin(BuildContext context,
      {required String name,
      required String phone,
      required String email,
      required String password,
      required String address,
    }) async {
    print('Fetching login API');
    final url = Uri.parse(
        "http://campus.sicsglobal.co.in/Project/Diy_product/api/user_registration.php");

    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {
          "name":name,
          "phone": phone,
          'email': email,
          'password':password,
          'address':address
        },
      );

      final responseData = json.decode(response.body);

      if (response.statusCode == 200 && responseData["status"] == true) {
      
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => CategoryScreen()),
          (Route<dynamic> route) => false,
        );
        // GlobalAlertDialog.show(context,
        //     value: 2, msg: '${responseData["message"]}!!');
         ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content :responseData["message"]));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content:responseData["message"] ?? "Login failed"));
      }
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Request timeout!! try again!")));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
