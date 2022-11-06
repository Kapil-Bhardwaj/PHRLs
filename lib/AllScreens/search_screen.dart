import 'package:flutter/material.dart';
import 'package:phrl/Widgets/pgCardInfo.dart';
import 'package:phrl/models/pg_data.dart';

import '../models/pg_model.dart';

class SearchScreen extends StatefulWidget {

   SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  TextEditingController locationController = TextEditingController();
   List<PG> pgSearchedResultName = [
     allPgData[0]
   ];

  void searchPgWithName(String query) {
      setState((){
              pgSearchedResultName = allPgData.where((element) => element.ownerName.toUpperCase().contains(query.toUpperCase())).toList();
      });}
  void searchPgWithLocation(String query)
  {
   setState((){
     pgSearchedResultName = allPgData.where((element) => element.location.toUpperCase().contains(query.toUpperCase())).toList();
   });

  }
String apper="Recently Searched";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
  final  searchBar = Container(
      child: TextField(


        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search,color: Colors.black,),
            contentPadding: EdgeInsets.only(left: 13),
            label: Text("Search",style: TextStyle(color: Colors.black,fontSize: 20),),


            fillColor: Colors.white,
            focusColor: Colors.green,
            filled: true,



            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(),
            )

        ),

        onChanged: searchPgWithName,


      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 20,
            offset: const Offset(12, 12),
          ),
        ],
      ),
    );

  final locationBar = Container(
    child: TextField(


      decoration: InputDecoration(
          prefixIcon: Icon(Icons.location_on,color: Colors.black,),
          contentPadding: EdgeInsets.only(left: 13),
          label: Text("Location",style: TextStyle(color: Colors.black,fontSize: 20),),


          fillColor: Colors.white,
          focusColor: Colors.green,
          filled: true,



          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(),
          )

      ),

      onChanged: searchPgWithLocation,
    ),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black38,
          blurRadius: 15,
          offset: const Offset(12, 12),
        ),
      ],
    ),
  );
  bool showRecent = true;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ), ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all( 24.0),
          child: Column(
            children: [
              searchBar,
              SizedBox(height: 32,),
              locationBar,
              SizedBox(height: 32,),
             TextButton(onPressed: (){//TODO: go to pg's at Haldwani Location//
                }, child: Container(
               child: Row(
                 children: [
                   Icon(Icons.my_location,color: Colors.black,size: 30,),
                   Text("  Use Current Location",style: TextStyle(fontSize: 22),)
                 ],
               ),
             )),
               Divider(color: Colors.black,),
              SizedBox(height: 2,),
              Padding(
                 padding: const EdgeInsets.only(bottom: 30),
                child: Text(apper,style: TextStyle(fontSize: 18),),
              ),

               Container(
                 height: MediaQuery.of(context).size.height*0.5,
                 width: MediaQuery.of(context).size.width,
                 child: ListView.builder(
                    itemCount: pgSearchedResultName.length,
                     itemBuilder: (context,index)
                     {
                       return Padding(padding: EdgeInsets.only(top: 20,bottom: 20),
                       child: PgCardInfo(pgSearchedResultName[index]),
                       );
                     }),
               ),
            ],
          )
        ),
      ),
    );


  }
}