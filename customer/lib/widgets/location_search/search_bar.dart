import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget{
  final Function pushSearch;
  final String address;
  const SearchBar({Key key,@required this.pushSearch,@required this.address}) : super(key: key);
  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
        onTap: pushSearch,
        child: Container(
          width: MediaQuery.of(context).size.width * 4.5 / 5,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 16.0, spreadRadius: 0.1)
              ]),
          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 14.0),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.search,
                color: Theme.of(context).primaryColor,
                size: 24.0,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  address,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0),maxLines: 1,overflow: TextOverflow.ellipsis,
                ),
              )),
            ],
          ),
        ),
      );
  }

}