import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget
{
  final String image,title;
  final bool isSelected;

  const GenderWidget({Key key,@required this.image,@required this.title, this.isSelected=false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.pinkAccent.withOpacity(0.05),
                      blurRadius: 8.0,
                      spreadRadius: 0.2,
                      offset: Offset(0.2, 1.0))
                ],
                borderRadius: BorderRadius.circular(16.0)),
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(image,height: 75.0,),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    title, style: TextStyle(color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0),),
                ),
              ],
            ),
          ),
          isSelected ? Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.check_circle, color: Colors.green, size: 28.0,),
          ) : Container(width: 0.00, height: 0.0,),
        ],
      ),
    );
  }

}