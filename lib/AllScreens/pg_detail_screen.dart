import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class MainContentOfPg extends StatelessWidget {
  const MainContentOfPg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
         toolbarHeight: MediaQuery.of(context).size.height*0.3,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        flexibleSpace: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/pg1.jpg'),
                      fit: BoxFit.fill
                  ),)
            ),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    child: FloatingActionButton(
                                 splashColor: Colors.red,
                      child:  Icon(Icons.arrow_back, color: Colors.grey,size: 30,),
                       backgroundColor: Colors.white,
                      onPressed: () => Navigator.of(context).pop(),),
                  ),
                  Row(
                    children: [
                      Container(
                        height: 35,
                        child: FloatingActionButton(
                          splashColor: Colors.red,
                          child:  Icon(Icons.exit_to_app, color: Colors.grey,size: 25,),
                          backgroundColor: Colors.white,
                          onPressed: () => Navigator.of(context).pop(),),
                      ),
                      Container(
                        height: 35,
                        child: FloatingActionButton(
                          splashColor: Colors.red,
                          child: Text("❤️",style: TextStyle(fontSize: 20),),
                          backgroundColor: Colors.white,
                          onPressed: () => Navigator.of(context).pop(),),
                      ),

                    ],
                  )
                ],
              )
            ),
          ],
        ),
      ),
      body:Column(
crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top : 24.0, bottom: 8,left: 80 ),
            child:Column(
              children: [
                Text("Sharma Ji INN",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

                Text("Haldwani ,Uttrakhand",style: TextStyle(fontSize: 20),),
              ],
            )
          ),
          Divider(
            thickness: 2,
            color: Colors.red.shade100,

          ),
          Padding(
            padding: const EdgeInsets.only(top : 12.0, bottom: 8,left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Description",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Text("  * 1 Bedroom ",style: TextStyle(fontSize: 20),),
                Text("  * 2 Bathroom ",style: TextStyle(fontSize: 20),),
                Text("  * 2 Beds ",style: TextStyle(fontSize: 20),),
                Text("  * 24/7 Water supply ",style: TextStyle(fontSize: 20),),
                Text("  * Kichen ",style: TextStyle(fontSize: 20),),
                Text("  * 1 Bedroom ",style: TextStyle(fontSize: 20),),
              ],
            ),



          ),
          Divider(
            thickness: 2,
            color: Colors.red.shade100,

          ),
           Padding(
             padding: EdgeInsets.all(5),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [ Row(
                 children: [
                   Text("₹ 999",style: TextStyle(fontSize: 25,color: Colors.grey,fontWeight: FontWeight.bold),),
                   Text(" per/month"),

                 ],

               ),
                 ElevatedButton(onPressed: (){
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Call Sharma ji : 9760735769"),backgroundColor: Colors.green,));
                 },
                     style: ElevatedButton.styleFrom(
                       primary: Colors.orange,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30.0),
                       ),
                     ),
                     child: Row(

                   children: [
                     Icon(Icons.call,color: Colors.black,),
                     Text(" Book Now",style: TextStyle(color: Colors.black),)
                   ],
                 ))


               ],
             ),)
        ],
      ),
    );
  }
}
