import 'package:flutter/material.dart';
import 'package:new_provider_code/login&Register/provider/registerprovider.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController namecontroller = TextEditingController();
   TextEditingController phonecontroller = TextEditingController();
   TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
     TextEditingController addresscontroller = TextEditingController();
     final _formkey=GlobalKey<FormState>();
   
     

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Register',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<AuthProvider>(
          builder: (context,provider,_){
            return provider.isLoading?CircularProgressIndicator():
            Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  registerForm(
                    hinttext: 'Name',
                    icon: Icons.person,
                    controller: namecontroller,
                    validator: (value) {
                      if (namecontroller.text.isEmpty) {
                        return 'Please enter your name';
                      } else {
                        return null;
                      }
                    },
                  ),
                   registerForm(
                    hinttext: 'Phone',
                    icon: Icons.phone_android,
                    controller: phonecontroller,
                    validator: (value) {
                      if (phonecontroller.text.isEmpty) {
                        return 'Please enter your phone';
                      } else {
                        return null;
                      }
                    },
                  ),
                   registerForm(
                    hinttext: 'Email',
                    icon: Icons.email,
                    controller: emailcontroller,
                    validator: (value) {
                      if (emailcontroller.text.isEmpty) {
                        return 'Please enter your email';
                      } else {
                        return null;
                      }
                    },
                  ),
                   registerForm(
                    hinttext: 'Password',
                    icon: Icons.lock,
                    controller: passwordcontroller,
                    validator: (value) {
                      if (passwordcontroller.text.isEmpty) {
                        return 'Please enter your password';
                      } else {
                        return null;
                      }
                    },
                  ),
                   registerForm(
                    hinttext: 'Address',
                    icon: Icons.location_on,
                    controller: addresscontroller,
                    validator: (value) {
                      if (addresscontroller.text.isEmpty) {
                        return 'Please enter your address';
                      } else {
                        return null;
                      }
                    },
                  ),
                  registerButton(title: 'Register', color: Colors.amber, ontap:(){
                    if(_formkey.currentState!.validate()){
                    Provider.of<AuthProvider>(context, listen: false).userlogin(
              context,
              name: namecontroller.text.trim(),
              phone: phonecontroller.text.trim(),
              email: emailcontroller.text.trim(),
              password: passwordcontroller.text.trim(),
              address: addresscontroller.text.trim(),
            );
          
                    }
            
                  })
                ],
              ),
            ),
          );
          }
          
        ),
      ),
    );
  }

  Widget registerForm({
    required String hinttext,
    required IconData icon,
    required TextEditingController controller,
    required String? Function(String?)? validator,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        hintText: hinttext,
        prefixIcon: Icon(icon),
      ),
    );
  }
  Widget registerButton({required String title,required Color color,required Function() ontap}){
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: color,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        onPressed: ontap, child:Text(title)),
    );

  }
}
