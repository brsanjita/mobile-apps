import 'package:flutter/material.dart';

class EmailLoginButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final bool isLoading;

  const EmailLoginButton( this.text,{Key key, this.onTap, this.isLoading=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: !isLoading ? 1.0 : 0.5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(6.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.pinkAccent.withOpacity(0.2),
                      blurRadius: 12.0,
                      spreadRadius: 0.1,
                      offset: Offset(0.5, 0.8))
                ]),
            margin: EdgeInsets.all(0.0),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: isLoading ? null : onTap,
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: isLoading
                      ? CircularProgressIndicator()
                      : Text(
                          text,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0,
                              color: Colors.white),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
