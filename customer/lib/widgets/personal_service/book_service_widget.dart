import 'package:customer/models/personal_service/book_service.dart';
import 'package:customer/screens/personal_service/special_instruction_screen.dart';
import 'package:flutter/material.dart';

class BookServiceWidget extends StatelessWidget {
  final BookService service;
  final bool isBooked;
  final Function(BookService service, bool added) onAdded;

  const BookServiceWidget({Key key, this.service, this.onAdded, this.isBooked=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        "${service.title}",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(
          "\$${service.price}",
          style: TextStyle(color: Colors.green, fontSize: 14.0),
        ),
      ),
      trailing: RaisedButton(
        onPressed: () async {
          if (isBooked) {
            onAdded(service, false);
            return;
          }
          await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SpecialInstructionScreen(
                    bookService: service,
                  )));
          onAdded(service, true);
        },
        elevation: 0.0,
        child: Text(
          "${isBooked ? "Remove" : "Add"}",
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.normal),
        ),
        color: Colors.green,
      ),
    );
  }
}
