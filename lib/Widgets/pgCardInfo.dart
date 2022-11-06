import 'package:flutter/material.dart';
import 'package:phrl/AllScreens/pg_detail_screen.dart';
import '../models/pg_model.dart';
class PgCardInfo extends StatelessWidget {
  PG pg;
        PgCardInfo(this.pg);
  @override
  Widget build(BuildContext context) {
    final _ratingController = TextEditingController();
    double _userRating = 4.5;




    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Card(
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0)),
          elevation: 8,
          child: Container(
            height: height*0.27,
            width: width*0.91,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(16)
                ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FlatButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainContentOfPg()));
                  },

                  child: Container(
                    height: height*0.19,
                    width: width*0.91,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: AssetImage(pg.imageUrl),
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,

                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height*0.005,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(pg.ownerName,style: TextStyle(
                        fontSize: 19,

                      ),),

                      Row(
                        children: [

                        Icon(Icons.star,color: Colors.amber,),
                          Icon(Icons.star,color: Colors.amber,),
                          Icon(Icons.star,color: Colors.amber,),
                          Icon(Icons.star,color: Colors.amber,)


                          ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height*0.006,
                ),
               Row(
                 children: [
                   SizedBox(width: width*0.03,),
                   Text("₹ ${pg.rentCost}  ",style: TextStyle(
                     fontSize: 19,color: Colors.grey
                   ),
                   ),

                   Text("per/month",style: TextStyle(
                       fontSize: 17,
                   ),
                   ),
                 ],
               )

              ],
            ),

          ),
        ),

      ],

    );
  }
}
