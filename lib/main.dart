import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phrl/AllScreens/LoginScreen.dart';
import 'package:phrl/AllScreens/search_screen.dart';
import 'package:phrl/Widgets/Circle.dart';
import 'package:phrl/Widgets/GradientText.dart';
import 'package:phrl/Widgets/pgCardInfo.dart';

import 'models/pg_data.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        // This is the theme of your application.

        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    final appBar = AppBar(
      toolbarHeight: MediaQuery.of(context).size.height*0.15,

      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,

      title: Column(
        children: [
          SizedBox(
            height: 12,
          ),
         GradientText("PHRL",style: TextStyle(
           fontWeight: FontWeight.bold,
           fontSize: 26
         ), gradient: LinearGradient(colors: [
           Colors.blue.shade400,

           Colors.red.shade900,
           Colors.yellow.shade900,
           Colors.blue.shade900,

         ])),
          
          Container(
              width: width*0.7,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                   primary: Colors.red.shade100
                    ,

                  ),
                  onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                  }, child:  Row(
                children: [
                  Icon(Icons.search,color: Colors.black,),
                  Text("Search",style: TextStyle(color: Colors.black),),
                ],
              ),

              )
          )
          // Container(
          //   width: width*0.89,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(100),
          //     border: Border.all(
          //       style: BorderStyle.solid
          //     )
          //   ),
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Text('Search',style: TextStyle(color: Colors.black),),
          //   ),
          //   )


        ],
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container
              (
              color: Colors.white,
              child: Row(
                mainAxisAlignment:  MainAxisAlignment.spaceAround,
                children: [
                  Circle("assets/images/pg.jpeg"),
                    Circle('assets/images/house.jpeg'),
                    Circle("assets/images/hotel.jpeg"),
                    Circle("assets/images/lounge.jpeg"),
                ],
              )
            ),
            SizedBox(
              height: height*0.012,
            ),
            Container(
              height: height*0.22,
              width: width*0.92,
              decoration: BoxDecoration(
                border: Border.all(),

              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    FittedBox(child: Text("Dicrover top deals for\nnearby stays",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27.0),)),
                    // SizedBox(height: height*0.03,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("max. 200 from your location",),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(

                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                          },
                          child: Text("Check Prefrences",style: TextStyle(color: Colors.black),),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                    
                                )
                            ),
                           backgroundColor: MaterialStateProperty.all(Colors.yellow.shade600),
                        ),
                        ),

                        Container(
                          height: height*0.05,
                          width: width *0.19,
                          child: Image.asset("assets/images/maplocation.png"),
                        ),
                      ],
                    )


                  ],
                ),
              ),
            ),
            SizedBox(height: height*0.03,),
              PgCardInfo(allPgData[0]),
            SizedBox(height: height*0.03,),
            PgCardInfo(allPgData[1]),
            SizedBox(height: height*0.03,),
            PgCardInfo(allPgData[2]),
            SizedBox(height: height*0.03,),

          ],
        ),
      ),
    );
  }
}
