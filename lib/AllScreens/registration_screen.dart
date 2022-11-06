
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:phrl/main.dart';
import '../services/auth_service.dart';
import 'LoginScreen.dart';


class RegisterScreen extends StatelessWidget {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController  confrimPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,


      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 16.0,right: 16.0),
        child: Column(children: [
          SizedBox(height: 40,),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'E-mail',
              border: OutlineInputBorder(),

            ),
          ),
          SizedBox(height: 12,),
          TextField(
            obscureText: true,
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'password',
              border: OutlineInputBorder(),

            ),
          ),
          SizedBox(height: 12,),
          TextField(
            obscureText: true,
            controller: confrimPasswordController,
            decoration: InputDecoration(
              labelText: 'confirm password',
              border: OutlineInputBorder(),

            ),
          ),
          SizedBox(height: 12,),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),

                  ),),

              ),
              onPressed: ()async{
                if(emailController.text.isEmpty || passwordController.text.isEmpty)
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All feild Required"),backgroundColor: Colors.red,));
                }else if(passwordController.text != confrimPasswordController.text)
                {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Confirm Password does not match"),backgroundColor: Colors.red,));

                }else{
                 User? result =  await AuthSevice().register(emailController.text, passwordController.text);
                 if(result != null)
                  {
                   print("sucessFULL");
                   print(result.email);
                   Navigator.pushAndRemoveUntil(
                     context,
                     MaterialPageRoute(builder: (context) => MyHomePage()),
                         (Route<dynamic> route) => false,
                   );
                   }
                }

              },
              child: Text("Submit",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ),
          ),
          SizedBox(height: 12,),
          TextButton(onPressed: (){
            print("kapil");

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),

            );
          }, child: Text("Already have an account? Login here"))
        ],),
      ),
    );
  }
}

class AuthService {
}
