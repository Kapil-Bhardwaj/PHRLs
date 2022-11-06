import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String text;
  Function() function;

  Color color, Tcolor2;
  Button(this.text, this.color, this.Tcolor2, this.function, {Key? key})
      : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: RaisedButton(
        splashColor: Colors.green,
        focusColor: color,
        color: color,
        onPressed: function,
        child: Container(
          height: 50,
          width: MediaQuery.of(context).devicePixelRatio * 90,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Tcolor2,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(24),
        ),
      ),
    );
  }
}
