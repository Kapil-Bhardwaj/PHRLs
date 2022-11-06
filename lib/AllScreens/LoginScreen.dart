import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phrl/AllScreens/registration_screen.dart';
import 'package:phrl/main.dart';
import '../Widgets/button.dart';
import '../services/auth_service.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white60,
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "firstScreen");
                      },
                      icon: Icon(Icons.login),
                      color: Colors.black,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.black),
                    ),
                  ],
                )),
            Image.asset('assets/images/PHRL.png'),
            SizedBox(height: 30),

            SizedBox(
              height: 3.0,
            ),
            Padding(
              padding: EdgeInsets.only(right: 50, left: 10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                  icon: Icon(
                    Icons.email,
                  ),
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: EdgeInsets.only(right: 50, left: 10),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  icon: Icon(
                    Icons.remove_red_eye,
                  ),
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: EdgeInsets.only(left: 120,bottom: 40),
              child: Text("Forgot Password?"),
            ),

            Container(
              height: 40,
              width: MediaQuery.of(context).size.width*0.7,
               child: ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.orange,
              //
              //   ),
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
                   }else{
                     User? result =  await AuthSevice().login(emailController.text, passwordController.text);
                     if(result != null)
                     {
                       print("sucessFULL");
                       print(result.email);
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                     }
                   }

                 },
                child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
              ),
            ),
            SizedBox(
              height: 20,
            ),
             TextButton(onPressed: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => RegisterScreen()),

               );
             }, child: Text("Dont't have an account! Register here"))
          ],
        ),
      ),
    );
  }
}
