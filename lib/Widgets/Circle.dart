import 'package:flutter/material.dart';
class Circle extends StatelessWidget {
  final String intake;
  Circle(this.intake);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: MediaQuery.of(context).size.height*0.045,
        backgroundColor: Colors. grey.shade300,
        backgroundImage: ExactAssetImage(intake),


       
      ),
    );
  }
}
